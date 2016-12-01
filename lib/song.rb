class Song
  attr_accessor :name, :artist_name, :create
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == name
      return name
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    return @@all.sort_by {|song| song.name} 
  end

  def self.new_from_filename(filename)
    filename = filename.gsub!(/[\.-]/, " ").split(" ")
    filename.pop
    artist = filename[0]
    filename.shift
    song = filename.join(" ")
    song = find_or_create_by_name(song)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    filename = filename.gsub!(/[\.-]/, " ").split(" ")
    filename.pop
    artist = filename[0]
    filename.shift
    song = filename.join(" ")
    song = find_or_create_by_name(song)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
