# frozen_string_literal: true

require 'httparty'
require 'nokogiri'

require_relative 'lib/product_scraper'

product_scraper = ProductScraper.new
response = HTTParty.get('https://powertool-supplies.co.uk/bga-200-cordless-blower-ap-system-sti-ba010115900/')
product_scraper.document = Nokogiri::HTML(response.body)
puts "PRODUCT TITLE:\n#{product_scraper.scrape_product_title}\n\n"
puts "DESCRIPTION:\n#{product_scraper.scrape_description}\n\n"
puts "PRODUCT IMAGE URLs:\n#{product_scraper.scrape_images}\n\n"
puts "PRICE:\n#{product_scraper.scrape_price}\n\n"
puts "STOCK STATUS:\n#{product_scraper.scrape_stock_status}\n\n"

# response = HTTParty.get('https://powertool-supplies.co.uk/festool-plug-it-cable-h05-rn-f-5-5-gb.html')
# product_scraper.document = Nokogiri::HTML(response.body)
# puts "PRODUCT TITLE:\n#{product_scraper.scrape_product_title}\n\n"
# puts "DESCRIPTION:\n#{product_scraper.scrape_description}\n\n"
# puts "PRICE:\n#{product_scraper.scrape_price}\n\n"

response = HTTParty.get('https://powertool-supplies.co.uk/18v-blower-lxt-dub183z/')
product_scraper.document = Nokogiri::HTML(response.body)
puts "PRODUCT TITLE:\n#{product_scraper.scrape_product_title}\n\n"
puts "STOCK STATUS:\n#{product_scraper.scrape_stock_status}\n\n"
