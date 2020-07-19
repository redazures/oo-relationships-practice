
class Project
#must have pledge goal amount
#no_pledges, above_goal, most backers

    attr_accessor :title, :users, :pledges, :first_pledge
    @@all=[]

    def initialize (title, pledge, user, goal)
        puts "#{user} has created the #{title} project. He has pledge #{pledge}!"
        first_pledge=Pledge.new(title,pledge,user)
        @pledges=[first_pledge]
        @title=title
        @goal=goal
        # @users=user
        # @pledge=pledge
        @@all<<self
    end

    def self.all
        @@all
    end

    # def add_pledge (pledge,user)
    #     next_pledge=Pledge.new(self.title, pledge, user)
    #     @pledges<<next_pledge
    # end

    # def pledges
        
    # end

end
