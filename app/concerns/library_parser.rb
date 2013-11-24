class LibraryParser
   
    def parse_filename(filename)
       file_parts = filename.split('-')
       [file_parts[0].trim, file_parts[1].trim] 
    end
    
    def self.parse
       #read all from data folder and return an array
        files = []
        Dir["./db/data"].each{ |f| files.push f.to_s}
        files
    end
end