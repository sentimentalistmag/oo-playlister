class LibraryParser
    attr_accessor :files
    @@files
    
    def initialize
        @@files = []
        self.files = []
    end
    def parse_filename(filename)
        file_parts =  /([a-z\s]*).*\-\s*([0-9a-z\s\(\)\.\+\&\'\,]*)\s*\[([a-z\-]*)/i.match(filename)
        [file_parts[1], file_parts[2], file_parts[3]] 
    end
    
    def build_song(*parts)
        puts 'build_song ' 
        puts parts
        song = Song.new
        song.artist = parts[0]
        song.name = parts[1]
        song.genre = parts[2]
        song
    end    
    
    def call
       LibraryParser.parse 
    end
    def self.parse
       #read all from data folder and return an array
        self.files = []
        parser = LibraryParser.new
        Dir[File.join(File.dirname(__FILE__), "../../db/data", "*")].each do |f| 
            #puts 'Got a file name '
            filename = File.basename(f)
            puts filename
            self.files << filename
            parser.files << filename
            parsed_song = parser.parse_filename(filename)
            Genre.new.tap { |genre| genre.name = parsed_song[2]}
        end
       
        
        #Dir["./db/data"].each{ |f| self.files.push f.to_s}
        puts 'Files ' 
        puts self.files
        self.files
    end
    
    def self.files=(files)
       @@files = files 
    end
    
    def self.files
       @@files 
    end
end