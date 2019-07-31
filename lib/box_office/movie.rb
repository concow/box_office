class BoxOffice::Movie
  attr_accessor :title, :rating, :total_gross, :this_week
  
  @@all = []
  
  def initialize
    @@all << self
  end 
  
  def self.all
    return @@all
  end
end