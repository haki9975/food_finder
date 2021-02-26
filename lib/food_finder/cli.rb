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
          goodbye_2
       else
          puts "I didn't understand that, please enter Y or N"
      end
         
          
    end
  end

  def display_recipes
          input = nil
        puts "Would you like to cook any of these recipes? Select recipe by number. Type 6 to list different recipes. Type 7 to quit."
       # puts recipe_accessor
       # input = gets.chomp
    until input == 7 do
      puts recipe_accessor
      input = gets.chomp
      input = input.to_i
       if input < 5 && input > 0
          input = input -1
         #FoodFinder::Recipe.all
         #input = gets.chomp
        elsif input == 6
          puts "Displays 5 different recipes"
          recipe_accessor
         #input.gets.chomp
        elsif input == 7
          goodbye_2
        elsif input > 7
          puts "I didn't understand that, please enter 1-7"
        end
          input = gets.chomp
    end

  end

  def recipe_accessor
    FoodFinder::Recipe.some.collect.with_index(1) {|meal, index| "#{index}. #{meal}"}  
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