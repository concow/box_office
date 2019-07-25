#CLI controller

class BoxOffice::CLI 
  
  def call
    list_movies
    ask_sort_by_rating
    ask_sort_by_total_gross
    goodbye
  end
  
end