require_relative '../config/environment.rb'
require 'pry'

def reload
  load 'config/environment.rb'
end

#traits
mac=["red hair","scottish"]
balls=["harry","sweaty"]
bottle=["full","bourbon"]
guns=["bang bang","danga"]
tears=["salty","tasty"]

#actors
mac=Actor.new("mac",mac)
balls=Actor.new("balls",balls)
bottle=Actor.new("bottle",bottle)
guns=Actor.new("gunner",guns)
tears=Actor.new("tears",tears)

#characters for braveheart
william=Character.new("william",mac)
wallace=Character.new("wallace",mac)
brave=Character.new("brave",mac)
rain=Character.new("rain",tears)
# boom=Character.new("boom",guns)
# braveheart=[william,wallace,brave,rain,boom]
braveheart=[william,wallace,brave,rain]

#shower_back_mountain
man=Character.new("shower_man",mac)
crying=Character.new("crying",tears)
vodka=Character.new("vodka",bottle)
shower_back_mountain=[man,crying,vodka]
shower_back_mountain_tv=[man,crying,vodka]
#movies
braveheart=Movie.new("Braveheart",braveheart)
shower_back_mountain=Movie.new("shower_back_mountain",shower_back_mountain)

#show
shower_back_mountain_tv=Show.new("shower_back_mountain",shower_back_mountain_tv)

binding.pry
