require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # Creates a new song and saves it to the class variable
  def self.create
    new_song = self.new
    self.all << new_song

    new_song
  end

  # Only creates a new song
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name

    song
  end

  # Creates a new song with a name and saves it to the class variable
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name

    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  # Checks if song exist and returns that object,
  # else it creates a new object and returns it
  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)

    if song != nil && song.name == song_name
      return song
    else
      new_song = self.create_by_name(song_name)
      return new_song
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  # Only creates a Song instance
  def self.new_from_filename(file)
    song_attributes = parse_mp3(file)
    artist = song_attributes[0]
    song_name = song_attributes[1]

    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  # Creates and saves a Song instance
  def self.create_from_filename(file)
    song_attributes = parse_mp3(file)
    artist = song_attributes[0]
    song_name = song_attributes[1]

    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

  private

  # Removes string literal ".mp3" and
  # returns an array including artist's name and song name
  def self.parse_mp3(mp3)
    mp3.chomp(".mp3").split(" - ")
  end

end
