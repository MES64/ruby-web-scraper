# frozen_string_literal: true

# ProductScraper
class ProductScraper
  attr_accessor :document

  def scrape_product_title
    document.css('h1.productView-title').text
  end
end
