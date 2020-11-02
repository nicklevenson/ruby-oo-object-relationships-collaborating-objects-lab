class Artist
    attr_accessor :name

    @@all

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all 
       @@all
    end

    def songs
        # @songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        match = @@all.select do |artist| 
            if artist.name == name
                artist
            end
        end 
       match != [] ? match[0] : Artist.new(name)
    end

    def print_songs 
        @@all.each do |artist|
            artist.songs.each do |song|
                puts song.name
            end 
        end
    end
    

end
