require 'pry'
class BoxOffice::Scraper
  
  def self.scrape_data
    url = "https://www.rottentomatoes.com/browse/box-office/"
    doc = Nokogiri::HTML(open(url))
    
    #NEW OPTION has a length of 1
    section = doc.css(".scrollable-table")      #original table. info all held here
    #length of 51
    movies = section.css("tr")                  #many container holds all attributes
    
    #section.css("tr")[1].text                  #returns first container all the attributes
    
    
    
    
    
    #movies has length of 30+
    #movies = section.css("td.left")           #only lists movie titles
    #movies = section.css("tr")               #length of 51
    movies = section.css("tr td")             #length of 450 this may be the same as above
    
    #movies.each do |movie|
    #movie_object = BoxOffice::Movie.new
    #WE MAY want to iterate over section.css("td")    That includes all our info.
      ranking = section.css("td")[1].text.strip
      rating = section.css("span.tMeterScore")[0].text.strip
      title = section.css("td.left")[0].text.strip
      total_gross = section.css("td")[6].text.strip
     
      binding.pry
     
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
  end
end