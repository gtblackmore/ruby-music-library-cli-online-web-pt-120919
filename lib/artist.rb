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

  def add_song(song)
    if song.artist != self
      @songs << song
      song.artist = self
    end
  end

  def genres
    artist_genres = []

    songs.each{|song| artist_genres << song.genre if !artist_genres.include?(song.genre)}
    
    artist_genres
  end

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end 