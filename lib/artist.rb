require "concerns"

class Artist
    attr_accessor :name, :songs

    extend Concerns::Findable
  
    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
      save
    end
  
    def name
      @name
    end
  
    def name=(name)
      @name = name 
    end
    
    def add_song(song_name)
      if song_name.artist != self
        song_name.artist = self
        @songs << song_name
      end
    end
    
    def genres
      artist_genres = []
      
      @songs.each{|song| artist_genres << song.genre if !@songs.include?(song.genre)}
      
      artist_genres
    end
      
    
    def songs
      @songs
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
      Artist.new(name)
    end
  end