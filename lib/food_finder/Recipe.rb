
class FoodFinder::Recipe 
    #store data from API class
    attr_accessor :idMeal, :strMeal, :strCategory, :strArea, :strInstructions, :strTags, :strIngredient1, :strDrinkAlternate

    @@all = []
    def initialize(recipe)
        recipe.each do |key, value| 
           next unless self.class.method_defined?(key)
              self.send(("#{key}="), value)
            end
            #binding.pry
        @@all << self

      
     end
   
      def self.all
        @@all
      end
end