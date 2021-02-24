

class API
    URL = "https://www.themealdb.com/api/json/v1/1/random.php"

    def random_recipes
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end
   
end

    random_rec = API.new.random_recipes