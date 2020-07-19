require_relative '../config/environment.rb'
require_relative '../app/project.rb'
require_relative '../app/user.rb'
require_relative '../app/pledge.rb'

def reload
  load 'config/environment.rb'
end

#users
james=User.new("James")
ben=User.new("Ben")
stan=User.new("stan")
cal=User.new("cal")
mac=User.new("mac")

#users creating projects
#title, goal, initial pledge
mac.new_project("dungeons",4500,1000)
cal.new_project("dragons4",4500,0)
stan.new_project("bball",9000,)
# james.add_pledge("dungeons",202)
# james.new_project("crack",10000000)
ben.new_project("kyle",100000,5000)

#test area******************************
# dungeons=Project.new("dungeons", 2000, james,100000)
# dragons=Project.new("Dragons", -1000, james)
# sky_high=Project.new("skyhigh",1000,james)
# dragons4=Project.new("dragons4",5000,ben,100000)
#dungeons.add_pledge(200,ben) #Can a project force a user to fund the project? Yes! 
james.look_up_projects 
#Project.all
# binding.pry
a="a"
b="b"
c="c"
x= ben.add_pledge("dungeons", 1000)
y= james.add_pledge("kyle",200)
z= stan.add_pledge("kyle",100000)
# x= ben.add("dragons", 1000)
# james.new_project("kyle",100000)
# p james.check("kyle")
# j =james.select_project ("dungeons", b)
# ja = james.test("c","j","h")
# y= ben.create_project ("name","pledge")
# x= ben.add_pledge ("Dragons", 1000)
binding.pry