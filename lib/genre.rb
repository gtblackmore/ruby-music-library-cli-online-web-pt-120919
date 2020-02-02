class Genre
    attr_accessor :name, :songs

    extend Concerns::Findable
    
    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
      save
    end
    
    def songs
      @songs
    end
    
    def add_song(song_name)
      if songs.include?(song_name) == false
        @songs << song_name
      end
    end

    def artist
      genre_artists = []

      songs.each{|song| genre_artists << song.artist if !genre_artists.include?(song.artist)}
    end

    
    def self.all
      @@all
    end
    
    def self.destroy_all
      @@all.clear
    end
    
    def save
      @@all << self
    end
    
    def self.create(name)
      Genre.new(name)
    end
  end