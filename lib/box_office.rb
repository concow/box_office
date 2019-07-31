#THIS FILE/MODULE REQUIRES ALL MY FILES, my environment
#OUR classes our inheriting this module for all requirements
#metaprogramming

module BoxOffice 
 
end

require 'open-uri'
require 'nokogiri'
require 'rake'
require 'pry'       #is locate in Gemfile per /bin/console instructions

require_relative "./box_office/version.rb"
require_relative './box_office/cli.rb'
require_relative './box_office/movie.rb'
require_relative './box_office/scraper.rb'

#require_relative 'box_office/scraper.rb'