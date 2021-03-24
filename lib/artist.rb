require "pry"

class Artist
        attr_accessor :name, :songs

        extend Concerns::Findable
        
        @@all = []
        
        def initialize(name)
            @name = name
            @songs = []
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
    
        def add_song(song)
            song.artist = self unless song.artist == self
            @songs << song unless @songs.include?(song)
        end 

        def songs
            Song.all.select {|song| song.artist}
        end

        def genres
            self.songs.collect{|x| x.genre}.uniq
        end

        
     end
    