require 'pry'
#CLI Controller, responsible for welcoming user and managing user input
class FoodFinder::CLI
  @@all = []

  def call
    FoodFinder::API.recipes
    introduction
  end
   
  def introduction
          input = nil
    until input == "N" do
       puts "Are you hungry?  Enter Y to continue or N to quit"
       input= gets.chomp.downcase
      if input== "y"  
          display_recipes
       elsif input == "n"
          goodbye_1
       else
          puts "I didn't understand that, please enter Y or N"
      end
         
          
    end
  end

  def display_recipes
          input = nil
          puts recipe_displayall
        puts "Would you like to cook any of these recipes? Scroll up to see recipies and select recipe by entering the number. Type 27 to quit."
       
       # input = gets.chomp
    until input == 27 do
      input = gets.chomp.to_i
        if input < 26 && input > 0
          input -=1
         puts "#{recipe_all(input).strSource} Here is your #{recipe_all(input).strMeal} recipe link and here is a link to video instruction: #{recipe_all(input).strYoutube}."
        
         puts "Press 27 if you are ready to exit. Press 26 if you would like to see the recipe list again."
         input = gets.chomp.to_i
        elsif input == 26
          display_recipes
        elsif input == 27
          goodbye_2
        elsif input > 27 || input.class != Integer
          puts "I didn't understand that, please try again"
        end
          input = gets.chomp
    end

  end

  def recipe_accessor
    FoodFinder::Recipe.some.collect.with_index(1) {|meal, index| "#{index}. #{meal}"}  
  end

  def recipe_five
    puts FoodFinder::Recipe.five.collect.with_index(1) { |meal, index|"#{index}. #{ meal.strMeal }" }
  end    
  
  def recipe_displayall
    FoodFinder::Recipe.all.collect.with_index(1) { |meal, index| "#{index}. #{ meal.strMeal }" }
  end

  def recipe_all(input)
    FoodFinder::Recipe.all[input]
  end
 
    def goodbye_1
      puts 'Then I will be of no use to you!'
      exit
    end
    
  def goodbye_2
    puts 'Happy eating!'
    exit
  end

end
