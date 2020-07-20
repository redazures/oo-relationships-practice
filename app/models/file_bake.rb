# create files for your ruby classes in this directory
class Bakery
    attr_accessor :name, :shelf_of_desserts
    @@all=[]

    def initialize (name,dessert_array)
        @d_name=name
        temp=[]
        temp<<dessert_array
        @shelf_of_desserts=temp.flatten
        @@all<<self
    end

    def self.all
        @@all
    end

    def ingredients
        array_of_ingredients=@shelf_of_desserts.collect{|e|e.ingredients}.flatten
        # array_of_ingredients.collect{|e|e.calories}.inject(0){|sum,x|sum+x}
        array_of_ingredients.uniq
    end

    def desserts
        @shelf_of_desserts.collect{|e|e.d_name}
    end

    def average_calories
        array_of_ingredients=@shelf_of_desserts.collect{|e|e.ingredients}.flatten
        count=array_of_ingredients.count
        (array_of_ingredients.collect{|e|e.calories}.inject(0){|sum,x|sum+x}.to_f)/count
    end

    def shopping_list
        array_of_ingredients=@shelf_of_desserts.collect{|e|e.ingredients}.flatten.uniq
        array_of_ingredients.collect{|e|e.ing_name}
    end

end

class Dessert
    attr_accessor :d_name, :ingredients
    @@all=[]
    def initialize (name,ingredient_array)
        @d_name=name
        @ingredients=[]
        @ingredients<<ingredient_array
        @ingredients=ingredients.flatten
        @@all<<self
    end

    def ingredients
        array_of_ingredients=@ingredients.flatten
    end

    def bakery
        Bakery.all.select{|e|e.shelf_of_desserts.include?self}
    end

    def calories
        count=ingredients.count
        #e represents each of the ingredients inside this dessert
        @ingredients.collect{|e|e.calories}.inject(0){|sum,x|sum+x}.to_f/count
    end

    def self.all
        @@all
    end
end

class Ingredient

    attr_accessor :ing_name, :calories
    @@all=[]

    def initialize (ing_name, calories)
        @ing_name=ing_name
        @calories=0
        @calories+=calories
        @@all<<self
    end
    
    def dessert_array
        Dessert.all.select{|e|e.ingredients.include?self}
    end

    def bakery_array
        Bakery.all.select{|e|e.ingredients.include?self}
    end

    def self.all
        @@all
    end

    def self.find_all_by_name (string)
        self.all.select{|e|e.ing_name.include?string}
    end

end