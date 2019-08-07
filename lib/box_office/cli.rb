require 'pry'
class BoxOffice::CLI 
  
  attr_accessor :sorted_movies
  
  def start                     #instance method
    greet
    scrape_for_week
    scrape_for_data
    #print_details
    #list_titles
    #sort_weekendtotal
    
    sort_grosstotal
    #sort_numberweeks
    #menu
    
    #TO DO:
    #ASK: Weeks at the top box office
    #ASK: then list movies by gross total
    
  end
  def printering
    BoxOffice::Movie.all.each {current_week}
    puts "#{current_week}"
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
    puts "If you would like to see the top movies for this weekend please type 'top'"
    puts ""
    input = gets.strip.downcase
    
    case input
    when 'top'
      puts ""
      list_titles
    when 'weeks'
      puts ""
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

  def sort_grosstotal
    BoxOffice::Movie.all.map( &:to_s ).sort {|a,b| b.grosstotal <=> a.grosstotal}.each.with_index(1) do |movie, index|
      puts "#{movie.title}"
    end
  end
  
  def sort_numberweeks
    BoxOffice::Movie.all.reverse.sort_by {|key, value| value
    puts "#{key.title} #{key.numberweeks}"
    }
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