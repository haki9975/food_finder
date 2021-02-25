
class FoodFinder::Recipe 
    #store data from API class

    @@all = []
    def initialize{attribues}
        attributes.each{|key, value| self.send(("#{key}="), value)}
        @@all << self
    end

    def self.all
        @@all
    end
end