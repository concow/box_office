#THIS FILE/MODULE REQUIRES ALL MY FILES, my environment
#OUR classes our inheriting this module for all requirements
#metaprogramming

module BoxOffice 
 
end



require 'open-uri'
require 'nokogiri'
require 'rake'
#require 'pry' is locate in Gemfile per /bin/console instructions

require_relative "./box_office/version"
require_relative './box_office/cli'
require_relative './box_office/movie'
require_relative './box_office/scraper'


class BoxOffice::Movie
  attr_accessor :title, :rating, :total_gross, :this_week
  
  @@all = []
  
  def initialize
    @@all << self
  end 
end

 class Scraper
  
  def self.scrape_data
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/"))

     films = {}           #init hash
     #iterate over this #class="panel-body content_body"
     doc.css(".panel-body content_body").each do |movie|
      title = movie.css("a._top").text.strip
      #films[title.to_sym] = {
        #:rating => films.css(".tMeterScore").text.value
        #:total_gross => films.css(" ").text
        #:this_week => films.css(" ").text
      #}
  
       #binding.pry
    end
  end
end

