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
    self.new.save
  end

  def save
    self.class.all << self
    self
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == name ? name : self.create_by_name(name)
  end

  def self.alphabetical
    return self.all.sort_by {|song| song.name} 
  end

def self.new_from_filename(filename)
    array = filename.split(" - ")
    song = self.find_or_create_by_name(array[1].slice(0, array[1].length - 4))
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(filename)
   self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all.clear
  end
end
