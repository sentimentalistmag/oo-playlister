class Artist
    extend Findable
   
    attr_accessor :name, :url, :songs, :genres
    @@artists = []
    alias :all :songs
    
    #Instance methods 
    
    def initialize 
        self.name = '' 
        self.songs = []
        self.genres = []
        
        @@artists << self
        
        #puts @@artists
    end
    
   
    
    def add_song(song)
        if self.songs == nil
            self.songs = []   
        end
        self.songs.push song
        self.genres.push song.genre
        artists_found = 0
        song.genre.artists.each do |artist|
            if artist== self
               artists_found +=1 
            end
        end
        if artists_found == 0
            song.genre.artists.push self
        end
       
    end
    #this is wacky, are we being passed in songs with their values popuated
    #or is it just song titles in an array and we have to parse values here
    def add_songs(songs)
        puts songs
        [songs].flatten.each do |song|
            
            parts = song.name.split(" - ")
            puts 'song.name ' 
            puts song.name
            puts 'parts ' 
            puts parts
            artist = Artist.new
            artist.name = parts.first
    
            song = Song.new
            song.name = parts.last
            song.artist = artist
            #find genre by substringing out the [] part and then find the genre Genre.find_by_name name and add the song to it
    
            self.songs << song
            
            puts self.songs
            puts self.songs.count
        end
    end
    
     
    def url
       self.name.gsub(' ', '-').downcase + '.html' 
    end
    
    #Class methods
    
    def self.reset_all
        @@artists.clear
    end
    
    def self.all
       @@artists 
    end
    
    def self.count 
        return @@artists.count
    end
   
end