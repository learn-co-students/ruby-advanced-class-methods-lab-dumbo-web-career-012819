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
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(song_title)
    song = self.new 
    song.name = song_title
    song
  end
  
  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title
    song
  end
  
  def self.find_by_name(song_title)
    self.all.select {|song| song.name == song_title }[0]
  
  end
  
  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by! { |a| a.name }
  end
  
  def self.new_from_filename(song_title)
    song_details = song_title.split(/[-.]/)
    song = self.create_by_name(song_details[1].strip)
    song.artist_name = song_details[0].strip
    song
  end
  
  def self.create_from_filename(song_title)
    self.new_from_filename(song_title)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
