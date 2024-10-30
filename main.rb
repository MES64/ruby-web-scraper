# frozen_string_literal: true

require 'httparty'
require 'nokogiri'

require_relative 'lib/product_scraper'

product_scraper = ProductScraper.new
response = HTTParty.get('https://powertool-supplies.co.uk/bga-200-cordless-blower-ap-system-sti-ba010115900/')
product_scraper.document = Nokogiri::HTML(response.body)
p product_scraper.scrape_product_title
