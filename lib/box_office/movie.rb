class BoxOffice::Movie
  attr_accessor :title, :rating, :total_gross
  
  @@all = []
  
  def initialize
    @@all << self
  end 
  
  def self.all
    return @@all
  end
end