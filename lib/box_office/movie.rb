#class BoxOffice::Movie
class Movie  
  attr_accessor :title, :rating, :total_gross, :this_week
  
  @@all = []
  
  def initialize(hash)
    
    @@all << self
  end 
  
  def self.today
    
    #shows current movies today
    
  end
  
end