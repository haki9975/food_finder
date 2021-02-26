
class FoodFinder::Recipe 
    #store data from API class
    attr_accessor :idMeal, :strMeal, :strCategory, :strArea, :strInstructions, :strTags, :strIngredient1, :strYoutube, :strSource 

    @@all = []
   def initialize(recipe)
      recipe.each do |key, value| 
         next unless self.class.method_defined?(key)
            self.send(("#{key}="), value)
         end
      @@all << self
   end
   
    def self.some
      @@all.sample(5).map { |meal| meal.strMeal }
   end

   def self.five
      five = []
      five = @@all[0, 4]
      #binding.pry
   end

   def self.all
      @@all
   end
end