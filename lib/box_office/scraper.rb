require 'pry'
class BoxOffice::Scraper
  
  def self.scrape_data
    url = "https://www.rottentomatoes.com/browse/box-office/"
    doc = Nokogiri::HTML(open(url))
    
    #NEW OPTION has a length of 1
    section = doc.css(".scrollable-table")      #original table. info all held here
    
    #movies has length of 30+
    movies = section.css("td")          #selecting all td tags that hold data
    movies = section.css("table.centertable")
    binding.pry
    movies.each do |movie|
      movie_object = BoxOffice::Movie.new
      #binding.pry
      #movie_object.title = movie.css("td.left")[0].text.strip
      movie_object.title = movie.css("td.left")[0]
      movie_object.rating = movie.css("span.tMeterScore")[0].text.strip
      movie_object.ranking = movie.css("td")[1].text.strip
      movie_object.total_gross = movie.css("td")[6].text.strip
     
     binding.pry
     
     #doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/"))
     #doc.css(".scrollable-table").each do |movie|    #iterate over this
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