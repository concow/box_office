class BoxOffice::Movie
  attr_accessor :title, :rating, :ranking, :total_gross
  
  @@all = []
  
  def initialize
    @@all << self
  end 
  
  def self.all
    return @@all
  end
end