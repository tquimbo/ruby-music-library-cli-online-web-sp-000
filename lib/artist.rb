class Artist < Inherit

    

    def new_song(name, genre)
    Song.new(name, genre)
    end
    
    def songs
    Song.all.select {|song| song.artist}
    end
    
    def genres
    songs.map {|genre| song.genre}
    end
    


    end
    