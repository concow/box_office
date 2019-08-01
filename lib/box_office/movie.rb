class BoxOffice::Movie
  attr_accessor :title, :rating, :ranking, :total_gross
  
  @@all = []
  
  def initialize(hash)
    hash.each do |key, value|
      self.send("#{key}=", value)            #pass these k/v pairs on to objects we're init
    end
    @@all << self
  end 
  
  def self.all
    return @@all
  end
end