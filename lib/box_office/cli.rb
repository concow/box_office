#require 'pry'
class BoxOffice::CLI 
  
  def start                     #instance method
    greet
    scrape_movie
    menu
    #BoxOffice::Scraper.scrape_data
    
  end
  
  def greet
    puts "======================================="
    puts "Welcome to the Weekend Box Office Chart"
    puts "======================================="
    
    #puts "Would you like to sort by 'Tomato Rating'? (Yes/No)"
    #input = gets.strip.downcase
  end
  
  def scrape_movie
    BoxOffice::Scraper.scrape_data
  end
  
  def menu
    puts "Would you like to see the Top Movies in theaters 'THIS WEEK'? (Yes/No)"   #INTERPOLATE current_week here
    input = gets.strip.downcase
  end
  
  
end