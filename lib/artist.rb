class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

    @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.find_by_name(name)
    @@all.detect{|a| a.name == name}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def genres
    self.songs.map{|song|song.genre}.uniq
  end

  def add_song(song)
    if !songs.include?(song)
    @songs << song
    end
    if song.artist == nil
     song.artist = self
    end
  end

  #def add_songs(songs)
    #songs.each { |song| add_song(song) }
  #end

  #def to_param
    #name.downcase.gsub(' ', '-')
  #end
end
