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
    artist_genre = []

    songs.each do |song|
      artist_genre << song.genre if !artist_genre.include?(song.genre)
    end

    collection
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
    @@all = []
  end
end 