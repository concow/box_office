#require 'pry'
class BoxOffice::CLI 
  
  def start                     #instance method
    greet
    scrape_movie
    #menu
    list_titles
    list_stars
    #BoxOffice::Scraper.scrape_data
    
    #FIND A WAY TO DISPLAY CURRENT WEEK
    #list movies by ranking
    #list movies by gross total 
    #list details, like stars in the movie
    
  end
  
  def greet
    puts "======================================="
    puts "Welcome to the Weekend Box Office Chart"
    puts "======================================="
    puts " "
  end
  
  def scrape_movie
    BoxOffice::Scraper.scrape_data
    BoxOffice::Scraper.scrape_week
  end
  
  def menu
    puts "Would you like to see the Top Movies in theaters #{BoxOffice::Movie.current_week}? (Yes/No)"   #INTERPOLATE current_week here
    input = gets.strip.downcase
    #if input == "yes" || "y" || "Yes"
      #list_titles
    #else
      #exit!
  end
  
  def list_titles
    BoxOffice::Movie.all.each do |movie|
      puts "#{movie.title}"
    end
  end
  
  def display_week
    
  end
  
  def list_stars
    BoxOffice::Movie.all.each do |st|
      puts "#{st.stars}"
    end
  end
  
  
end