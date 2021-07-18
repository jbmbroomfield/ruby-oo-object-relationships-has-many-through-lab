class Genre
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def songs
        Song.all.filter { |song| song.genre == self }
    end
    
    def artists
        self.songs.map { |song| song.artist }.uniq
    end

    def self.all
        @@all
    end
end