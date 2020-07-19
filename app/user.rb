

class User
#users can create and back projects, a user will have mutiple connections to projects based on these different roles
#needs highest_pledge, mutiple_pledger, project creator

    attr_accessor :name, :look_up_projects, :pledge, :amount, :user, :title
    @@all=[]
    @@creaters=[]

    def initialize (name)
        @name=name
        @@all<<self
    end

    def look_up_projects
         Project.all.collect{|project|project.title}
    end

    # def add_pledge (title,pledge)
    #     tests=Pledge.new(title, pledge, self)
    #     Project.all.select {|project| project.title==title}[0].pledges<<tests
    # end

    def add_pledge(title,pledge)
        tests=Pledge.new(title, pledge, self)
        Project.all.select{|project| project.title==title}[0].pledges<<tests
    end

    def new_project (title,goal,pledge=0)
        puts "Project #{title} already exists, please resubmit under a different name" if !check(title)
        @@creaters<<self if check(title)
        new_pj=Project.new(title,pledge,self,goal) if check(title)
    end

    def check (title) #this assist with checking if the project already exists
        !self.look_up_projects.include?(title)
    end

    def self.all
        @@all
    end

    def self.inside
        container=[]
        pls=[]
        Project.all.each do |projects|
            container<<projects.pledges
        end
        container.flatten
    end

    def self.high
        high_number =0
        high_rolla =""
        array_of_all_pledges=self.inside
        array_of_all_pledges.each do|pledge|
            high_rolla=pledge.user if pledge.amount>high_number
            high_number=pledge.amount if pledge.amount>high_number
        end
        high_rolla
    end

    def self.multiple #this finds pledges that have made multiple pledges
        temp=[]
        array_of_all_pledges=self.inside
        array_of_all_pledges.each do |pledge|
            temp<<pledge if pledge.amount>0
        end
        # temp.find_all{|e|temp.count(e)>1}
        x=temp.collect{|pledge|pledge.user.name} #takes all the names of the pledges
        x= x.find_all{|e|x.count(e)>1} #this reduces the array to only names that appear more than once
        x= x.uniq #this will reduce the array one instance of the name
    end

    def self.project_creators
        @@creaters
    end

end
