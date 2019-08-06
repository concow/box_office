#require 'pry'
class BoxOffice::CLI 
  
  def start                     #instance method
    greet
    scrape_for_week
    scrape_for_data
    menu
    #list_titles
    #list_titles_by_index
    #list_stars
    
    #TO DO:
    #add current week to an attribute?
    #ASK: Weeks at the top box office
    #ASK: then list movies by gross total 
    #ASK: then list details, like stars in the movie
    
  end
  
  def greet
    puts "======================================="
    puts "Welcome to the Weekend Box Office Chart"
    puts "======================================="
    puts ""
    puts "Here are the top movies for the"
  end
  
  def scrape_for_week
    BoxOffice::Scraper.scrape_week
    puts ""
  end
  
  def scrape_for_data
    BoxOffice::Scraper.scrape_webpage
  end

  def menu
    puts "Would you like to see the Top Movies in theaters 'THIS WEEK? (Yes/No)" #INTERPOLATE current_week here
    input = gets.strip.downcase
    if input == "yes" || "y" || "Yes"
      puts ""
      list_titles_by_index
    else
      puts "Goodbye!"
    end
  end

  def list_titles_by_index
    BoxOffice::Movie.all.each_with_index do |movie, index|
      puts "#{index + 1} #{movie.title}"
    end
  end

  def list_stars
    BoxOffice::Movie.all.each do |st|
      puts "#{st.stars}:"
    end
  end
end