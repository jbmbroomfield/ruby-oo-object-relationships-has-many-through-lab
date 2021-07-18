class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def songs
        Song.all.filter { |song| song.artist == self }
    end

    def genres
        self.songs.map { |song| song.genre}.uniq
    end

    def self.all
        @@all
    end
end