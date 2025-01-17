class Song
  attr_accessor :name, :genre
  attr_reader :artist
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.genre = genre if genre
    @name = name
    self.artist = artist if artist
    
  end

  def self.find_by_name(name)
    all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    #if a song with a matching name is in @@all
    #return song found
    #else 
    #return new song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end
 
  def self.create(name) 
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2].gsub(".mp3","")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
    
  end

  def self.create_from_filename(filename)
  song = new_from_filename(filename)
  song.save
  end

  #def to_param
    #name.downcase.gsub(' ', '-')
  #end
end
