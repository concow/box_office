class BoxOffice::CLI

  def start
    greet
    scrape_for_data
    run
  end

  def greet
    puts ""
    puts "======================================="
    puts "Welcome to the Top Box Office (US) App"
    puts "======================================="
    puts ""
    puts "THESE ARE THE TOP MOVIES FOR:"
  end

  def scrape_for_data
    BoxOffice::Scraper.scrape_webpage
    BoxOffice::Scraper.scrape_week
    binding.pry
    puts ""
  end

  def run
    sleep 1.0
    puts "-------------------------------------------------------"
    puts "Would you like to see our search options (again)? (Y/N)"
    puts "-------------------------------------------------------"

    input = gets.strip.upcase
    if input == "Y"
      puts ""
      menu
    elsif input == "N"
      puts ""
      puts "Thank you! Have a good one!"
      exit
    else
      puts ""
      puts "I don't understand that request."
      puts ""
      run
    end
  end

  def menu
    puts "-------------------------------------------------------"
    puts "* To see the Top 10 movies for this weekend TYPE 'top'"
    puts "* To see their weekend earnings TYPE 'weekend'"
    puts "* To see the details of each movie TYPE 'detail'"
    puts ""
    puts "To exit the app type 'exit'"
    puts "-------------------------------------------------------"

    input = gets.strip.downcase

    case input
    when 'top'
      puts ""
      list_titles
      loop_method
    when 'weekend'
      puts ""
      sort_earnings
      loop_method
    when 'detail'
      puts ""
      print_details
      loop_method
    when 'exit'
      puts ""
      puts "Goodbye!"

    else
      puts ""
      puts "I don't understand that request."
      sleep 1.5
      menu
    end
  end

  def loop_method
    puts ""
    sleep 1.5
    run
  end

  def list_titles
    BoxOffice::Movie.all.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.title}"
    end
  end

  def sort_earnings
    BoxOffice::Movie.all.sort_by {|movie| movie.weekendtotal
      puts "#{movie.title}: #{movie.weekendtotal}"
    }
  end

  def print_details
    BoxOffice::Movie.all.each do |movie|
      puts " "
      puts "****************************************************"
          puts "Movie Title: #{movie.title}"
          puts "URL: #{movie.url}"
          puts "Weekend Gross: #{movie.weekendtotal}"
          puts "Total Gross: #{movie.grosstotal}"
          puts "Weeks at Top: #{movie.numberweeks}"
          puts "Cast: #{movie.stars}"
      puts "****************************************************"
    end
  end
end
