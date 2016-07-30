
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

  def self.new_by_name(by_name)
    song = self.new
    song.name = by_name
    song
  end
  def self.create_by_name(by_name)
    song = self.create
    song.name = by_name
    song
  end

  def self.find_by_name(by_name)
    @@all.detect do |item|
      by_name == item.name
    end
  end

  def self.find_or_create_by_name(by_name)
    self.all.include?(by_name) ? self.find_by_name(by_name) : self.create_by_name(by_name)
  end

  def self.alphabetical
    self.all.sort_by do |word|
        word.name
    end
  end

  # def parse_filename(filename)
  #   filename = filename.split("-")
  #   song.artist_name = filename[0].strip
  #   song.name = File.basename(filename[1],File.extname(filename[1])).strip
  #end
  #probably could have creatd some method to parse filename and avoid repeating
  def self.new_from_filename(filename)
    filename = filename.split("-")
    song = self.new
    song.artist_name = filename[0].strip
    song.name = File.basename(filename[1],File.extname(filename[1])).strip
    song
  end

  def self.create_from_filename(filename)
    filename = filename.split("-")
    song = self.create
    song.artist_name = filename[0].strip
    song.name = File.basename(filename[1],File.extname(filename[1])).strip
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
