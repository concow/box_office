class BoxOffice::Movie
  attr_accessor :title, :weekendtotal, :grosstotal, :numberweeks, :stars
  attr_writer :url

  @@all = []
  
  def initialize
    @@all << self
  end 
  
  def self.all
    return @@all
  end
  
  def url=(url)
    @url = "https://www.imdb.com" + url
  end
end