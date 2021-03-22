class Inherit

    attr_accessor :name
    
    @@all = []
    
    def initialize(name)
        @name = name
    end
    
    def save
        @@all << self
    end

    def self.all
    @@all
    end

    def self.destroy_all
    Song.all.clear
    end
    
    def self.create(name)
        create = new(name)
        create.save
        create
    end

 end