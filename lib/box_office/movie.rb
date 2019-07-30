
class BoxOffice::Movie
  attr_accessor :title, :rating, :total_gross, :this_week
  
  @@all = []
  
  def initialize(hash)
    
    @@all << self
  end 

  
end

