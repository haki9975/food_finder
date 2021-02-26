require 'pry'
#CLI Controller, responsible for welcoming user and managing user input
class FoodFinder::CLI
 
  def call
    FoodFinder::API.recipes
    introduction
  end
   
  def introduction
    puts "Are you hungry?  Enter Y to continue or N to quit"
    input = gets.chomp

    if input == "y"
      display_recipes
    elsif input == 'n'
      goodbye_1
    else
      puts "I didn't understand that, please try again"
      introduction
    end
  end
  #         input = nil
  #         puts "starts a loop A"
  #  # until input == "N" do
  #      puts "Are you hungry?  Enter Y to continue or N to quit"
  #      input= gets.chomp.downcase
  #     if input== "y"  
  #         display_recipes
  #      elsif input == "n"
  #         goodbye_1
  #      else
  #         puts "I didn't understand that, please enter Y or N"
    #   end
         
          
    # end
    # puts "ends a loop A"
  #end

  def display_recipes
          # input = 0
        puts recipe_displayall
        puts "Would you like to cook any of these recipes? Scroll up to see recipies and select recipe by entering the number. Type 27 to quit."
       
        input = gets.chomp
      if input.to_i == 27
          goodbye_2
      else

        recipe = recipe_all(input.to_i - 1)

        puts "Here is your #{recipe.strMeal} recipe link: #{recipe.strSource}."
        puts "Here is a link to video instruction for your #{recipe.strMeal}:  #{recipe.strYoutube}."
        puts "Press 27 if you are ready to exit. Press 26 if you would like to see the recipe list again."

        input = gets.chomp
        if input.to_i == 27
          goodbye_2
        elsif input.to_i == 26
          display_recipes
        else
          puts "I didn't understand that, please try again"
          display_recipes
        end
      end
      # puts "start loop B"
    # until input == 27 do
    #   input = gets.chomp.to_i
      
    #     if input < 26 && input > 0
    #       input -=1
    #      puts "Here is your #{recipe_all(input).strMeal} recipe link:#{recipe_all(input).strSource}"
    #      puts "Here is a link to video instruction for your #{recipe_all(input).strMeal}:  #{recipe_all(input).strYoutube}."
    #      puts "Press 27 if you are ready to exit. Press 26 if you would like to see the recipe list again."
    #      input = gets.chomp.to_i
    #     elsif input == 26
    #       display_recipes
    #     elsif input == 27
    #       goodbye_2
    #     elsif input.class != Integer || input > 27 || input <= 0
    #       puts "I didn't understand that, please try again"
    #     end
    #       input = gets.chomp
    #  end
        
    #     puts "end loop B"
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
