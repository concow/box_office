require 'pry'
class BoxOffice::CLI 
  
  attr_accessor :sorted_movies
  
  def start                     #instance method
    greet
    scrape_for_week
    scrape_for_data
    menu
  end

  def greet
    puts "======================================="
    puts "Welcome to the Top Box Office (US) App"
    puts "======================================="
    puts ""
    puts "These are the top movies up to the"
  end
  
  def scrape_for_week
    BoxOffice::Scraper.scrape_week
    puts ""
  end
  
  def scrape_for_data
    BoxOffice::Scraper.scrape_webpage
  end

  def menu
    ask_options
  end
    
  def ask_options
    puts "--------------------------------------------------------------------------------"
    puts "Would you like to see our search options (Yes/No)"
    
    input = gets.strip.downcase
    
    if input == "Yes" || "y"
      call
    else 
      #exit_method
    end
  end
    
  def call
    puts "--------------------------------------------------------------------------------"
    puts "If you would like to see the top 10 movies for this weekend type 'top'."
    puts ""
    puts "To see the top grossed movies by total type 'total'."
    puts ""
    puts "To see the details of each movie type 'detail'."
    puts ""
    puts "To exit the app type 'exit'."
    puts "--------------------------------------------------------------------------------"

    input = gets.strip.downcase
    
    case input
    when 'top'
      puts ""
      list_titles
      some_loop_method
    when 'weekend'
      puts ""
      sort_weekendtotal
    when 'detail'
      puts ""
      print_details
    when 'exit'
      puts ""
      puts "Goodbye!"
      #exit_method
    end
  end

  def list_titles
    BoxOffice::Movie.all.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.title}"
    end
  end
  
  def sort_weekendtotal
    BoxOffice::Movie.all.sort_by {|movie| movie.weekendtotal
      puts "#{movie.title}: #{movie.weekendtotal}"
    }
  end
  
  def some_loop_method
    #sleep
    puts ""
    puts "Would you like to see out options again? (Yes/No)"
    
    input = gets.strip.downcase
    
    if input == "Yes" || "y"
      ask_options
    else
      #exit_method
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