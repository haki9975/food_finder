require 'pry'
#CLI Controller, responsible for welcoming user and managing user input
class FoodFinder::CLI
@@all = []
    def call
       introduction
      # goodbye
    end
    def introduction
          input = nil
        until input == "Exit" do
          puts "Are you hungry?  Enter Y to continue or N to quit"
            input= gets.chomp.downcase
          if input== "y"  
            continue_with_ingredient
          elsif input == "n"
           goodbye
          else
            puts "I didn't understand that, please enter Y or N"
          end
         
          
        end
    end

    def continue_with_ingredient
        puts "Do you have a main ingredient in mind? .(y/n)"
        input = nil
        until input = "exit" do
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
    
    def continue_without_ingredient
        puts <<-DOC
        5.times.do instantiates recipes from random recipes api
        Allows user to select a recipe or regenerate random list
        Once recipe is selected : Provides list of all ingredients, description, insturctions, and link to youtube video if possible
        option to exit program and option to restart
        DOC
    end

    def goodbye
        puts 'Happy eating!'
        exit
    end



end
#module FoodFinder
 #   class Error < StandardError; end
    # Your code goes here...
# end