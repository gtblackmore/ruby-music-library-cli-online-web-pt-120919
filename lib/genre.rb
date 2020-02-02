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
    artists_in_genre = []

    songs.each{|song| artists_in_genre << song.artist if !artists_in_genre.include?(song.artist)}
    
    artists_in_genre
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
    @@all.clear
  end
end 