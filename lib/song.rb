require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil, artist_name = nil)
  	@name = name
  	@artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	new_song = self.new
  	@@all << new_song
  	new_song
  end

  def self.new_by_name(title)
  	new_song = self.new(title)
  end

  def self.create_by_name(title)
  	new_song = self.new(title)
  	@@all << new_song
  	new_song
  end

  def self.find_by_name(title)
  	@@all.find do |song|
  		song.name == title
  	end
  end

  def self.find_or_create_by_name(title)
  	if self.find_by_name(title)
  		self.find_by_name(title)
  	else 
  		self.create_by_name(title)
  	end
  end

  def self.alphabetical
  	@@all.sort_by {|title| title.name}
  end

  # def initialize_and_split_filename
  # 	self.name.split(/[.]/)[0].split(/[-]/).map(&:strip)
  # end

  def self.new_from_filename(filename)
  	artist = filename.split(/[.]/)[0].split(/[-]/).map(&:strip)[1]
  	song_name = filename.split(/[.]/)[0].split(/[-]/).map(&:strip)[0]
  	self.new(artist, song_name)
  	# new_song.artist_name = new_song.name.split(/[.]/)[0].split(/[-]/).map(&:strip)[0]
  	# new_song.name = new_song.name.split(/[.]/)[0].split(/[-]/).map(&:strip)[1]
  	# new_song = self.new(filename)
  end

  def self.create_from_filename(filename)
  	new_song = self.new_from_filename(filename)
  	@@all << new_song
  end

  def self.destroy_all
  	@@all = []
  end

end

