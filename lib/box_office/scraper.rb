require 'pry'
class BoxOffice::Scraper
  
  def self.scrape_data
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/"))
    #puts "hey"
    doc.css(".panel-body content_body").each do |movie|    #iterate over this #class="panel-body content_body"
    end
    binding.pry
  end
end