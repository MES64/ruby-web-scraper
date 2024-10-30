# frozen_string_literal: true

require_relative 'lib/product_scraper'

product_scraper = ProductScraper.new
p product_scraper
product_scraper.document = 'https://powertool-supplies.co.uk/bga-200-cordless-blower-ap-system-sti-ba010115900/'
p product_scraper
p product_scraper.document
