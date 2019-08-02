class BoxOffice::Movie
  attr_accessor :title, :weekend, :gross, :weeks, :weekend_of
  
  @@all = []
  
  def initialize
    @@all << self
  end 
  
  def self.all
    return @@all
  end
end