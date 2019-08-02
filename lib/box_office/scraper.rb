require 'pry'
class BoxOffice::Scraper
  
  def self.scrape_data
    url = "https://www.imdb.com/chart/boxoffice"
    doc = Nokogiri::HTML(open(url))
    
    #NEW OPTION has a length of 1
    table = doc.css("div#boxoffice.article.listo")      #original table. info all held here
    #binding.pry
    
    #length of 11
    movies = table.css("tbody tr")                  #many container holds all attributes of the movies
  
    movies.each do |movie|
      title = movie.css("td.titleColumn").text
      weekend = movie.css("td.ratingColumn").text
      gross = movie.css("span.secondaryInfo").text
      weeks = movie.css("td.weeksColumn").text
      binding.pry
    end
  end
end
    #spanclass="secondaryInfo"
    
    
    
   
   
   
   
   
   
   
   
   
    #movies has length of 30+
    #movies = section.css("td.left")           #only lists movie titles
    #movies = section.css("tr")               #length of 51
    #movies = section.css("tr td")             #length of 450 this may be the same as above
    
    #movies.each do |movie|
    #movie_object = BoxOffice::Movie.new
    #WE MAY want to iterate over section.css("td")    That includes all our info.
      #ranking = section.css("td")[1].text.strip
      #rating = section.css("span.tMeterScore")[0].text.strip
      #title = section.css("td.left")[0].text.strip
      #total_gross = section.css("td")[6].text.strip
     
     
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