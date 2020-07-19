class User
#users can create and back projects, a user will have mutiple connections to projects based on these different roles
#needs highest_pledge, mutiple_pledger, project creator

    attr_accessor :name, :look_up_projects, :pledge, :amount, :user, :title
    @@all=[]

    def initialize (name)
        @name=name
        @@all<<self
    end

    def look_up_projects
         Project.all
    end

    def add_pledge (title,pledge)
        test=Pledge.new(title, pledge, self)
        Project.all.select {|project| project.title==title}[0].pledges<<test
    end

    def new_project (title,goal,pledge=0)
        new_pj=Project.new(title,pledge,self,goal)
    end

    def select_project (title, amount)
        # @user=self
        #this produces an array that has title inside along with a list of pledges
        #if x is the array then x[0].title is the name of the project and x[0].pledges is the pledges for the project
        #x[0].pledges[0] to access inside of the pledge 
        #x[0].pledges[0].amount is the amount for this pledge
        Project.all.select {|project| project.title==title}[0].pledges
        # x[0].pledges #this is selecting the pledges array that is inside the project
    end

end
