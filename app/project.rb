
class Project
#must have pledge goal amount
#no_pledges, above_goal, most backers

    attr_accessor :title, :users, :pledges, :first_pledge, :goal
    @@all=[]

    def initialize (title, pledge, user, goal)
        puts "#{user.name} has created the #{title} project. He has pledge #{pledge}!"
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

    def self.inside
        container=[]
        Project.all.each do |projects|
            container<<projects.pledges
        end
        container.flatten
    end

    def self.no_pledges #this return all pledges with 0 money in it
        self.inside.reject {|pledge|pledge.amount>0}
    end

    def self.pledges
        self.inside.select {|pledge|pledge.amount>0}
    end

    def self.most #most backers
        x=self.pledges.collect{|pledge|pledge.project}
        freq=x.inject(Hash.new(0)){|h,v| h[v]+=1; h} #stole this from the internet 
        #the above will count all the possible users in array
        name=x.max_by{|v|freq[v]}
        y=self.inside.select {|pledge|pledge.amount>0&&pledge.project==name}
        z=y.collect{|pledge|pledge.user.name}
        z=z.uniq.count
        puts "#{name} has #{y.count} pledges and #{z} backers"
        y
    end

    def self.above_goal
        above_goal=[]
        sum=0
        Project.all.each do|project|
            goal= project.goal
            # puts"the goal is #{goal}!"
            project.pledges.each do |x|
                # puts "this #{x.amount} amount is being added"
                sum= sum+ x.amount
            end
            # puts "the sum #{sum} vs #{goal}!"
            # puts project.title
            above_goal<<project if sum>goal
        end
        puts "#{above_goal[0].title} has gathered $#{sum} which is more than the pledge goal of #{above_goal[0].goal}"
    end

    # def add_pledge (pledge,user)
    #     next_pledge=Pledge.new(self.title, pledge, user)
    #     @pledges<<next_pledge
    # end

    # def pledges
        
    # end

end
