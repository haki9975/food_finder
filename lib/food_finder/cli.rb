require 'pry'
#CLI Controller, responsible for welcoming user and managing user input
class FoodFinder::CLI
  @@all = []

  def call
    FoodFinder::API.recipes
    introduction
      # goodbye
    end
   
    def introduction
          input = nil
        until input == "Exit" do
          puts "Are you hungry?  Enter Y to continue or N to quit"
            input= gets.chomp.downcase
          if input== "y"  
            display_recipes
          elsif input == "n"
           goodbye_2
          else
            puts "I didn't understand that, please enter Y or N"
          end
         
          
        end
    end

    def display_recipes
        puts "Would you like to cook any of these recipes? Select recipe by number. Type 6 to list different recipes. Type 7 to quit."
        input = nil
         puts recipe_accessor
        until input == "exit" do
             #FoodFinder::Recipe.all.sample(5)
           recipe_accessor
            input = gets.chomp.downcase
          if input == "1-6"
             #FoodFinder::Recipe.all
             #input = gets.chomp
          elsif input == "6"
            puts "Displays 5 different recipes"
            #input.gets.chomp
          elsif input == "7"
              goodbye_1
           else
            puts "I didn't understand that, please enter 1-7"
          end
        end

    end

    def recipe_accessor
      FoodFinder::Recipe.some
    
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
#module FoodFinder
 #   class Error < StandardError; end
    # Your code goes here...
# end