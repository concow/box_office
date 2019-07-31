#require 'pry'
class BoxOffice::CLI 
  
  def start                     #instance method
    puts "Welcome to the Weekend Box Office Chart"
    puts ""
    #puts "Would you like to see the Total Gross leaders? (Yes/No)"
    #input = gets.strip.downcase
    
    #puts "Would you like to sort by 'Tomato Rating'? (Yes/No)"
    #input = gets.strip.downcase
    
    #binding.pry
    BoxOffice::Scraper.scrape_data
  end
  
  
end