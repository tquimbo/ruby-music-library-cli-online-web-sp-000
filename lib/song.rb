require 'pry'

class Song

    attr_accessor :name, :artist, :genre

    extend Concerns::Findable
    
    @@all = []
    
    def initialize(name, artist=nil, genre=nil)
        @name = name 
        self.artist = artist if artist
        self.genre = genre if genre
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

 end