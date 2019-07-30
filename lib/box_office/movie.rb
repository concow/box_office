
class BoxOffice::Movie
  attr_accessor :title, :rating, :total_gross, :this_week
  
  @@all = []
  
  def initialize(hash)
    
    @@all << self
  end 
  
  def self.today
    
    #shows current movies today
    
  end
  
end

#class BoxOffice::Scraper
class Scraper
  def self.scrape_data
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/"))
    
    films = {}
   #iterate over this #class="panel-body content_body"
    
    doc.css(".panel-body content_body").each do |movie|
      title = movie.css("a._top").text.strip
      films[title.to_sym] = {
        :rating => films.css(".tMeterScore").text.value
        :total_gross => films.css(" ").text
        :this_week => films.css(" ").text
      }
      
      binding.pry
    end
  end 
end