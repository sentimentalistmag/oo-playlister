class LibraryParser
   # attr_writer :files
    @@files
    
    def initialize
        @@files = []
        self.files = []
        #LibraryParser.parse
    end
    def parse_filename(filename)
        file_parts =  /([a-z\s]*).*\-\s*([0-9a-z\s\(\)\.\+\&\'\,]*)\s*\[([a-z\-]*)/i.match(filename)
        [file_parts[1].strip, file_parts[2].strip, file_parts[3].strip] 
    end
    
    def build_song(*parts)
        
        song = Song.new
        artist = Artist.new.tap { |artist| artist.name = parts[0]}
        song.artist = artist
       
        song.name = parts[1]
        genre = Genre.new.tap { |genre| genre.name = parts[2]}
       
        # genre.songs.push song
        song.genre = genre
        
        song
        #pp song
    end    
    
   
    def reset_all
       @@files.clear 
    end
        
    def call
       LibraryParser.parse 
    end
    
    def files
       @@files 
    end
    
    def files=(files)
        @@files = files
    end
    def self.parse
       #read all from data folder and return an array
        self.files = []
        parser = LibraryParser.new
        Dir[File.join(File.dirname(__FILE__), "../../db/data", "*")].each do |f| 
            #puts 'Got a file name '
            filename = File.basename(f)
            #puts filename
            #self.files.push filename
            @@files << filename
            #parser.files.push filename
            parsed_song = parser.parse_filename(filename)
            Genre.new.tap { |genre| genre.name = parsed_song[2]}
        end
       
        
        #Dir["./db/data"].each{ |f| self.files.push f.to_s}
        #puts 'Files ' 
        #puts self.files
        self.files
    end
    
    def self.files=(files)
       @@files = files 
    end
    
    def self.files
       @@files 
    end
end