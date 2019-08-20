class BoxOffice::Movie
  attr_accessor :title, :weekendtotal, :grosstotal, :numberweeks, :stars
  attr_reader :url

  @@all = []

  def initialize(hash)
    hash.each do |key, value|
      self.send("#{key}=", value)
    end
    self.save
  end

  def self.all
     @@all
  end

  def save
    @@all << self
     self
  end

  def url=(url)
    @url = "https://www.imdb.com" + url
  end

  def self.search(string)
    all.select do |movie|
      movie.stars.include?(string)
    end
  end
end
