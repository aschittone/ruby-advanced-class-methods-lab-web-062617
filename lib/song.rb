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
    song.save
    song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = self.create
  	song.name = name
  	song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name)
  		name
  	else
  		self.new_by_name(name)
  	end
  end

  def self.alphabetical
  	@@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(file_name)
  	song = self.new
  	split_song_name = file_name.split(" - ")
  	song.artist_name = split_song_name[0]
  	split_name = file_name.split(".mp3")
  	name_wo_mp3 = split_name.join("").split("- ")
  	song.name = name_wo_mp3[1]
  	song
  end

  def self.create_from_filename(file_name)
  	song = self.new_from_filename(file_name)
  	song.save
  	song
  end

  def self.destroy_all
  	song_array = self.all
  	song_array.clear
  	song_array
  end
    
end
