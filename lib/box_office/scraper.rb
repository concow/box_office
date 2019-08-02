require 'pry'
class BoxOffice::Scraper
  
  def self.scrape_data
    url = "https://www.imdb.com/chart/boxoffice"
    doc = Nokogiri::HTML(open(url))
    
    #length of 1
    table = doc.css("div#boxoffice.article.listo")      #original table. info all held here
    
    current_week = doc.css("h4").text
    
    #length of 10
    movies = table.css("tbody tr")                  #many container holds all attributes of the movies
  
    movies.each do |movie|
      title = movie.css("td.titleColumn").text.strip
      weekend_total = movie.css("td.ratingColumn").first.text.strip
      total_gross = movie.css("span.secondaryInfo").text.strip
      number_weeks = movie.css("td.weeksColumn").text.strip
      binding.pry
    end
  end
end

     
     #OLD WAY
     #doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/"))
     #doc.css(".scrollable-table").each do |movie|    #iterate over this
     #BoxOffice::Movie.new ({
     #title: movie.css("td.left")[0].text.strip,
     #rating: movie.css("span.tMeterScore")[0].text.strip,
     #ranking: movie.css("td")[1].text.strip,
     #total_gross: movie.css("td")[6].text.strip
     #)}
     
    #end