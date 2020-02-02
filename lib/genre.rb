require "concerns"

class Genre 
  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    @songs << song
    song.genre = self
  end

  def artists
    collection = []

    songs.each do |song|
      collection << song.artist if !collection.include?(song.artist)
    end

    collection
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end
end 