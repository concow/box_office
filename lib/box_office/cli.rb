require 'pry'
class BoxOffice::CLI 
  
  def start                     #instance method
    greet
    scrape_for_week
    scrape_for_data
    print_details
    #list_stars
    #menu
    #list_titles
    
    #TO DO:
    #add current week to an attribute?
    #ASK: Weeks at the top box office
    #ASK: then list movies by gross total
    
  end
  
  def greet
    puts "======================================="
    puts "Welcome to the Top Box Office (US) App"
    puts "======================================="
    puts ""
    puts "This is up to the"
  end
  
  def scrape_for_week
    BoxOffice::Scraper.scrape_week
    puts ""
  end
  
  def scrape_for_data
    BoxOffice::Scraper.scrape_webpage
  end

  def menu
    puts "If you would like to see the top movies for the weekend type 'top'"
    puts "   "
    puts "   "
    puts "   "
    
    input = gets.strip.downcase
    
    case input
    when 'top'
      puts ""
      list_titles
    when 'weeks'
      puts""
      list_titles_by_week
    when 'gross_total'
      puts ""
      list_by_total
    when 'details'
      puts ""
      list_details
    when 'exit'
      puts "Goodbye!"
      menu
    end
  end

  def list_titles_by_index
    BoxOffice::Movie.all.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.title}"
    end
  end

  def list_stars
    BoxOffice::Movie.all.sort do |a, b|
      #binding.pry
      puts "#{a.title}: #{b.stars}"
      puts "#{a.title}: #{b.stars}"
    end
  end
  
  def print_details
    movie_attr = [
                  "Movie Title",
                  "URL",
                  "Weekend Gross:",
                  "Total Gross",
                  "Weeks at Top",
                  "Cast",
                  ]
    BoxOffice::Movie.all.each do |movie|
      puts " "
      puts "****************************************************"
      movie.instance_variables.each.with_index do |var, index|
        puts "#{movie_attr[index]}: #{movie.instance_variable_get(var)}"
      end
      puts "****************************************************"
    end
  end
end