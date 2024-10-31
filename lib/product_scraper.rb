# frozen_string_literal: true

require 'httparty'
require 'nokogiri'

# ProductScraper
class ProductScraper
  attr_reader :url, :document

  def initialize(url_string)
    self.url = url_string
  end

  def url=(url_string)
    @url = url_string
    @document = Nokogiri::HTML(HTTParty.get(url_string).body)
  end

  def scrape_product_title
    document.css('h1.productView-title').text
  end

  def scrape_description
    description_elements = document.at_xpath('//div[@itemprop]')
    description_elements.css('br').each { |br| br.replace("\n") }
    description_elements.css('li').each { |li| li << "\n" }
    description_elements.text.strip
  end

  def scrape_images
    document.css('a.productView-thumbnail-link').map { |image| image.attribute('href').value }
  end

  def scrape_price
    document.at_xpath('//span[@data-product-price-with-tax]').text
  end

  def scrape_stock_status
    if document.css('div.bb-availability-container dd').text == 'Sorry this item is currently unavailable'
      return 'Out of stock'
    end

    'In stock'
  end
end
