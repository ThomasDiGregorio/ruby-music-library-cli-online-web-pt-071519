class MusicImporter 
    def initialize(path)
        @path = path
    end

    def path
        @path
    end

    def files
        array = Dir.entries(@path)
        array.delete(".")
        array.delete("..")
        array  
    
    end
    
    def import
        files.each{|file|Song.create_from_filename(file)} 
    end
end