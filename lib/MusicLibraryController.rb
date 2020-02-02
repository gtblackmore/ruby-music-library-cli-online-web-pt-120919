require "MusicImporter"

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import()
  end

  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    input = ""
    while input != "exit"
      puts "What would you like to do?"
      input = gets.strip

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    sorted = Song.all.sort{|a, b| a.name <=> b.name}
    sorted.each_with_index{|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted = Artist.all.sort{|a, b| a.name <=> b.name}
    sorted.each_with_index{|artist, i| puts "#{i+1}. #{artist.name}"}
  end

  def list_genres
    sorted = Genre.all.sort{|a, b| a.name <=> b.name}
    sorted.each_with_index{|genre, i| puts "#{i+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Artist.find_by_name(artist_name)
    if !artist
    sorted = artist.songs.sort{|a, b| a.name <=> b.name}
    sorted.each_with_index{|song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    return if !genre
    sorted = genre.songs.sort{ |a, b| a.name <=> b.name }
    sorted.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    sorted = Song.all.sort{ |a, b| a.name <=> b.name }
    puts "Playing #{sorted[song_number-1].name} by #{sorted[song_number-1].artist.name}" if song_number < sorted.length && song_number > 0
  end
end 