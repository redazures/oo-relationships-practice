

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

    def self.high
        amount=0
        high_guy=""
        Project.all
        #collect {|pledge| pledge.pledges}
    end

    def self.project_creators
        @@creaters
    end

end
