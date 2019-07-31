#require 'pry'
class BoxOffice::CLI 
  
  def start                     #instance method
    #puts "Welcome to the App"
    #binding.pry
    BoxOffice::Scraper.scrape_data
  end
  
  
end