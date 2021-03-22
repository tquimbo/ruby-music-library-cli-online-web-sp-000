class Genre < Inherit
    
    def songs
        Song.all.select {|song| song.artist}
    end
    
    def artists
        songs.map {|artist| artist.genre}
    end
    
    end