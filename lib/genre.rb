class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
    attr_reader :genre
  
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
      genre = Genre.new(name)
      genre.save
      genre
    end
  
    def add_genre(genre)
      genre.each { |genre| add_genre(genre) }
    end

    def artists
        songs.collect do |song|
            song.artist 
            #binding.pry
        end.uniq
    end

    #def to_param
      #name.downcase.gsub(' ', '-')
    #end
  end
  