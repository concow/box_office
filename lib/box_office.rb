#THIS FILE/MODULE REQUIRES ALL MY FILES, my environment
#OUR classes our inheriting this module for all requirements
#metaprogramming

module BoxOffice 


end



require 'open-uri'
require 'nokogiri'
require 'pry'
require 'rake'

require_relative "./box_office/version"
require_relative './box_office/cli'
require_relative './box_office/movie'
require_relative './box_office/scraper'

