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
end
