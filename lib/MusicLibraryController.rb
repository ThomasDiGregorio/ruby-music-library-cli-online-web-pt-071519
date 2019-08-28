require 'pry'
class MusicLibraryController
    def initialize(path = "./db/mp3s")
        MusicImporter.new(path).import
    end

    def call
        puts("Welcome to your music library!")
        puts("To list all of your songs, enter 'list songs'.")
        puts("To list all of the artists in your library, enter 'list artists'.")
        puts("To list all of the genres in your library, enter 'list genres'.")
        puts("To list all of the songs by a particular artist, enter 'list artist'.")
        puts("To list all of the songs of a particular genre, enter 'list genre'.")
        puts("To play a song, enter 'play song'.")
        puts("To quit, type 'exit'.")
        puts("What would you like to do?")
        until input = gets.strip == "exit"
            #if input == "list songs"
            #end
        end
    end
    
    def list_songs
        sorted = Song.all.sort { |a, b| a.name <=> b.name }
        sorted.each_with_index do |song, idx|
            puts "#{idx + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
        end
    end

    def list_artists
        sorted = Artist.all.sort { |a, b| a.name <=> b.name }
        sorted.each_with_index do |artist, idx|
            puts "#{idx + 1}. #{artist.name}" 
        end
    end

    def list_genres
        Genre.all.sort { |a, b| a.name <=> b.name }.each_with_index do |genre, idx|
            puts "#{idx + 1}. #{genre.name}"
        end
    
        def list_songs_by_artist
            puts "Please enter the name of an artist:"
            input = gets.strip
            artist = Artist.find_by_name(input)
            if artist
             #"error message" 
            #else 
            sorted = artist.songs.sort  { |a, b| a.name <=> b.name }.each_with_index do |song, idx|
                puts "#{idx + 1}. #{song.artist.name} - #{song.genre.name}"
            end
        end
    end           
    end 
    
    
end