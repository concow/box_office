#CLI controller

#class BoxOffice::CLI 
class CLI  
  def call
    start
    list_movies
    ask_sort_by_rating
    ask_sort_by_total_gross
    goodbye
  end
  
  def start 
    puts "Welcome to our Top Box Office App"
    puts "Would you like to see the top rated movies of the week? (y/n)"
    input = gets.strip
    list_movies
    
    puts "Would you like to sort by rating or total gross?"
    if input == "rating" || "r" || "Rating"
      list_movies_by_rating
    elsif input == "total gross" || "total" || "Total Gross"
  end
  
end