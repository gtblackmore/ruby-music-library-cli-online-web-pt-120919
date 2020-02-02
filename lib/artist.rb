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
    return if song.artist
    @songs << song
    song.artist = self

  end

  def genres
    collection = []

    songs.each do |song|
      collection << song.genre if !collection.include?(song.genre)
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