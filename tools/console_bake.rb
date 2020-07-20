require_relative '../config/environment.rb'
require 'pry'
def reload
  load 'config/environment.rb'
end

#purple drink
purple=Ingredient.new("purple", 5)
purple_powder=Ingredient.new("purple_powder", 10)
sugar=Ingredient.new("sugar",10)
water=Ingredient.new("water",1)
purple_drink=[purple,sugar,water]
#old fashion
bourbon=Ingredient.new("bourbon",100)
orange=Ingredient.new("orange",15)
old_fashion = [bourbon,orange]
#ramen
flour=Ingredient.new("flour",47)
salt=Ingredient.new("salt",3)
ramen= [flour,salt]

#Desserts
purple_drink=Dessert.new("purple_drink",purple_drink)
old_fashion= Dessert.new("old_fashion",old_fashion)
ramen=Dessert.new("ramen",ramen)
purple_bourbon=Dessert.new("purple_bourbon",[purple,bourbon])
purple_ramen=Dessert.new("purple_ramen",[purple,flour,salt])
bourbon_double=Dessert.new("double_bourbon",[bourbon,bourbon])
#Bakery setup 
# purple_place=[purple_ramen,purple_bourbon,purple_drink]
# slainte=[purple_bourbon,old_fashion,bourbon_double]
# bake_n_cake=[ramen,purple_ramen,purple_drink]

purple_place=[purple_bourbon,purple_drink]
slainte=[old_fashion,bourbon_double]
bake_n_cake=[ramen,purple_drink]

#Bakeries
slainte=Bakery.new("slainte",slainte)
purple_place=Bakery.new("purple_place",purple_place)
bake_n_cake=Bakery.new("bake_n_cake",bake_n_cake)

binding.pry
