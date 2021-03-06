class BoxOffice::Scraper
  
  def self.scrape_webpage
    url = "https://www.imdb.com/chart/boxoffice"
    doc = Nokogiri::HTML(open(url))
    
    #length of 1
    table = doc.css("div#boxoffice.article.listo")      
    
    #length of 10
    movies = table.css("tbody tr")
  
    movies.each do |movie|
    
      attributes = {
        :title => movie.css("td.titleColumn").text.strip,
        :url => movie.css("td.titleColumn a")[0]['href'],              
        :weekendtotal => movie.css("td.ratingColumn").first.text.strip,
        :grosstotal => movie.css("span.secondaryInfo").text.strip,
        :numberweeks => movie.css("td.weeksColumn").text.strip,
        :stars => movie.css("td.titleColumn a")[0]['title'],            
      }
        #instantiated a new Movie Object
        movie_object = BoxOffice::Movie.new(attributes)               
    end
  end
  
  def self.scrape_week                  #scrapes current week
    doc = Nokogiri::HTML(open("https://www.imdb.com/chart/boxoffice"))
    current_week = doc.css("h4").text
    puts "#{current_week}"
  end
end