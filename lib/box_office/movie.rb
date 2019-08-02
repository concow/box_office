class BoxOffice::Movie
  attr_accessor :title, :weekendtotal, :totalgross, :numberweeks#, :url, :weekend_of, :stars
  
  @@all = []
  
  def initialize
    @@all << self
  end 
  
  def self.all
    return @@all
  end
end