#CLI controller

class BoxOffice::CLI
  def call
    #BoxOffice::Scraper.new.box_office
    puts "Welcome to the Top Box Office of the week"
    start
  end
  
  def start 
    puts ""
    puts "What rating and above would you like to see?"
    input = gets.strip.to_i
    list_movies
    
    puts "Would you like to sort by rating or total gross?"
    if input == "rating" || "r" || "Rating"
      list_movies_by_rating
    elsif input == "total gross" || "total" || "Total Gross"
  end
end