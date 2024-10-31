# frozen_string_literal: true

# ProductScraper
class ProductScraper
  attr_accessor :document

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
