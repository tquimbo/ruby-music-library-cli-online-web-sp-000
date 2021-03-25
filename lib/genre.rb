class Genre

        attr_accessor :name, :artist

        extend Concerns::Findable
        
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
            @@all.clear
        end
        
        def self.create(name)
            create = new(name)
            create.save
            create
        end

        def songs
            Song.all.select {|song| song.genre}
        end

        def artists
            self.songs.collect{|s| s.artist}.uniq
        end
    
    end