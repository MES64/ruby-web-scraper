# frozen_string_literal: true

require_relative 'lib/product_scraper'

product_scraper = ProductScraper.new('https://powertool-supplies.co.uk/bga-200-cordless-blower-ap-system-sti-ba010115900/')
puts "PRODUCT TITLE:\n#{product_scraper.scrape_product_title}\n\n"
puts "DESCRIPTION:\n#{product_scraper.scrape_description}\n\n"
puts "PRODUCT IMAGE URLs:\n#{product_scraper.scrape_images}\n\n"
puts "PRICE:\n#{product_scraper.scrape_price}\n\n"
puts "STOCK STATUS:\n#{product_scraper.scrape_stock_status}\n\n"
puts "PRODUCT URL:\n#{product_scraper.url}\n\n"

product_scraper.url = 'https://powertool-supplies.co.uk/18v-blower-lxt-dub183z/'
puts "PRODUCT TITLE:\n#{product_scraper.scrape_product_title}\n\n"
puts "STOCK STATUS:\n#{product_scraper.scrape_stock_status}\n\n"
puts "PRODUCT URL:\n#{product_scraper.url}\n\n"
