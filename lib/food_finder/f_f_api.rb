require 'net/http'
require 'open-uri'
require 'json'
 

class API
    URL = "https://www.themealdb.com/api/json/v1/1/random.php"

    def get_recipes
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end
   
end

    