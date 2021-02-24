

class GetRecipes
    URL = "https://www.themealdb.com/api/json/v1/1/random.php"

    def random_recipes
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    random_rec = Get.new.random_recipes