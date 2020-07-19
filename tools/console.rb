require_relative '../config/environment.rb'
require_relative '../app/project.rb'

def reload
  load 'config/environment.rb'
end

#test projects
james=User.new("James")
ben=User.new("Ben")
dungeons=Project.new("dungeons", 2000, james,100000)
# dragons=Project.new("Dragons", -1000, james)
# sky_high=Project.new("skyhigh",1000,james)
dragons4=Project.new("dragons4",5000,ben,100000)
dungeons.add_pledge(200,ben) #Can a project force a user to fund the project? Yes! 
james.look_up_projects 
#Project.all
# binding.pry
a="a"
b="b"
c="c"
james.add_pledge("dungeons",202)
james.new_project("crack",10000000)
ben.new_project("kyle",100000)
# j =james.select_project ("dungeons", b)
# ja = james.test("c","j","h")
# y= ben.create_project ("name","pledge")
# x= ben.add_pledge ("Dragons", 1000)
binding.pry