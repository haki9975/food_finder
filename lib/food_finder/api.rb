require 'net/http'
#require 'open-uri'
require 'json'
 

class FoodFinder::API
    URL = "https://www.themealdb.com/api/json/v1/1/search.php?s="
   
  @@all = []
  def initialize 
    @@all<<self
  end
    def self.random_recipes
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
        JSON.parse(response.body)
    end
   
end

    #random_rec = FoodFinder::API.new.random_recipes
    #puts random_rec