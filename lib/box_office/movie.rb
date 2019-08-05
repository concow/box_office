class BoxOffice::Movie
  attr_accessor :title, :weekendtotal, :grosstotal, :numberweeks, :stars#, :current_week
  attr_writer :url

  @@all = []
  
  def initialize(hash)
    hash.each do |key, value|
      self.send("#{key}=, value")
    end
    
    @@all << self
  end 
  
  def self.all
    return @@all
  end
  
  def url=(url)
    @url = "https://www.imdb.com" + url
  end
end