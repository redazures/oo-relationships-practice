class Actor
    attr_accessor :name, :positive
    @@all=[]

    def initialize (name,traits)
    @name=name
    temp=[]
    temp<<traits
    @positives=temp.flatten
    @@all<<self
    end

    def self.all
        @@all
    end

end

class Character
    attr_accessor :char_name, :actor
    @@all=[]

    def initialize (char_name, actor)
        @char_name=char_name 
        @actor=actor
        @@all<<self
    end

    def self.all
        @@all
    end

end

class Movie 
    attr_accessor :blockbuster, :characters
    @@all=[]

    def initialize(name,character)
        @blockbuster=name
        temp=[]
        temp<<character
        @characters=temp.flatten
        @@all<<self     
    end

    def actors
        @characters.collect{|e|e.actor}.uniq
    end

    def self.most_actors
        # num=@@all.collect{|e|e.actors.count}
        lots_of_actors=""
        high_actors=0
        extra=[]
        @@all.each do |e|
            lots_of_actors=e if e.actors.count>high_actors
            extra<<e if e.actors.count==high_actors
            high_actors=e.actors.count if e.actors.count>high_actors
        end
        extra<<lots_of_actors if extra.any?
        lots_of_actors=extra if extra.any?
        lots_of_actors
    end

    def self.all
        @@all
    end
end

class Show
    attr_accessor :tv_show, :characters
    @@all=[]

    def initialize(name,character)
        @tv_show=name
        temp=[]
        temp<<character
        @characters=temp.flatten
        @@all<<self     
    end

    def self.all
        @@all
    end
end