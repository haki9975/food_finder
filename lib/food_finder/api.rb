require 'net/http'
require 'open-uri'
require 'json'
 

class FoodFinder::API
    URL = "https://www.themealdb.com/api/json/v1/1/random.php"
  @@all = []
  def initialize 
    @@all<<self
  end
    def random_recipes
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end
   
end

    random_rec = API.new.random_recipes