require "concerns"

class Song 
  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
    save
  end

  def genre=(genre)
    return if genre == nil
    genre.add_song(self) if !genre.songs.include?(self)
    @genre = genre
  end

  def artist=(artist)
    return if artist == nil
    artist.add_song(self) if !artist.songs.include?(self)
    @artist = artist
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name)
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
end 