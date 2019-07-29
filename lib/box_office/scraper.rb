require 'open-uri'
require 'nokogiri'
require 'pry'
require 'rake'

#class BoxOffice::Scraper
class Scraper 
  def self.scrape_data
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/"))
    
   #iterate over this #class="panel-body content_body"
    
    doc.css(".panel-body content_body").each do |movie|
      binding.pry
    end
  end 
end