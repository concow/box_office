require 'pry'
class BoxOffice::Scraper
  
  def self.scrape_data
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/"))
    doc.css(".scrollable-table").each do |movie|    #iterate over this
     #BoxOffice::Movie.new ({
     #title: movie.css("td.left")[0].text.strip,
     #rating: movie.css("span.tMeterScore")[0].text.strip,
     #ranking: movie.css("td")[1].text.strip,
     #total_gross: movie.css("td")[6].text.strip
     #)}
     binding.pry
    end
  end
end