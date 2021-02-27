require 'net/http'
require 'open-uri'
require 'json'
 

class FoodFinder::API
    URL = "https://www.themealdb.com/api/json/v1/1/search.php?s="
       def self.recipes
           uri = URI.parse(URL)
      response = Net::HTTP.get_response(uri)
      response.body
          data = JSON.parse(response.body)
      data["meals"].each { |meal| FoodFinder::Recipe.new(meal) }
    end
   end

