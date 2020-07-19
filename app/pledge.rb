
class Pledge
#project, returns the project for particular pledge
#user, returns the user for the particular pledge
    attr_accessor :amount, :user, :project
    @@all_pledges=[]

    def initialize (project, amount=0, user)
        if amount<0
            puts "MF, You can't take money out from a project! Pledge amended on to 0"
            puts "You have pledge 0 dollars, cause you are a broke ass! or a stupid asshole"
            amount=0
        end
        @project=project
        @amount=amount
        @user=user
        save
    end

    def self.all_pledges
        @@all_pledges
    end

    def project
        @project
    end

    def user
        @user.name
    end

    def save
        @@all_pledges<<self
    end

end
