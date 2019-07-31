require 'pry'
class BoxOffice::Scraper
  
  def self.scrape_data
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/"))
    doc.css(".scrollable-table").map do |movie|    #iterate over this #class="panel-body content_body"
     movie.css("td.left")[0].text.strip
     movie.css("span.tMeterScore")[0]
     binding.pry
    end
  
  end
end