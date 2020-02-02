require "concerns"

class Song
    attr_accessor :name
    attr_reader :artist, :genre
  
    @@all = []
  
    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist
      self.genre = genre
      save
    end
    
    def name
      @name
    end
    
    def artist=(artist)
      if artist != nil
        @artist = artist
        artist.add_song(self)
      end
    end
    
    def genre=(genre)
      if genre != nil
        @genre = genre
        genre.add_song(self)
      end
    end
    
    def self.new_from_filename(filename)
      filename.slice!(".mp3")
      info = filename.split(" - ")
      song = Song.new(info[1])
      song.artist = Artist.find_or_create_by_name(info[0])
      song.genre = Genre.find_or_create_by_name(info[2])
      song
    end

    def self.create_from_filename(filename)
      new_from_filename(filename)
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
      Song.new(name)
    end
  end