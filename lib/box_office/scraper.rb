require 'pry'
class BoxOffice::Scraper
  
  def self.scrape_data
    url = "https://www.imdb.com/chart/boxoffice"
    doc = Nokogiri::HTML(open(url))
    
    #length of 1
    table = doc.css("div#boxoffice.article.listo")      #original table. info all held here
    
    #length of 10
    movies = table.css("tbody tr")                      #many container holds all attributes of the movies
  
    movies.each do |movie|
      movie_object = BoxOffice::Movie.new               #instantiated a new Movie Object
      
      movie_object.title = movie.css("td.titleColumn").text.strip
      movie_object.url= movie.css("td.titleColumn a")[0]['href']              #WORKING ON THIS
      movie_object.weekendtotal = movie.css("td.ratingColumn").first.text.strip
      movie_object.grosstotal = movie.css("span.secondaryInfo").text.strip
      movie_object.numberweeks = movie.css("td.weeksColumn").text.strip
      movie_object.stars = movie.css("td.titleColumn a")[0]['title']            #WORKING ON THIS
      
      #movie.css("td.titleColumn a")[0].attributes['href'].value              #same return for url
      #https://www.imdb.com                                                   #add this to scrape
    binding.pry
    end
    
  end
  
  def self.scrape_week                  #scrapes current week
    doc = Nokogiri::HTML(open("https://www.imdb.com/chart/boxoffice"))
    current_week = doc.css("h4").text
    return current_week
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