require 'pry'
#CLI Controller, responsible for welcoming user and managing user input
class FoodFinder::CLI
  @@all = []

  def call
      FoodFinder::API.new.recipes
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
           goodbye
          else
            puts "I didn't understand that, please enter Y or N"
          end
         
          
        end
    end

    def display_recipes
        puts "Do you have a main ingredient in mind? .(y/n)"
        input = nil
        until input == "exit" do
            input = gets.chomp.downcase
          if input == "y"
            puts "List of main ingredients"
          elsif input == "n"
            puts "Displays 5 random recipes"
            input.gets.chomp
          else
          end
        end

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