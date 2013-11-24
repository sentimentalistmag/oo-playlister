class Artist
    extend Findable
   
    attr_accessor :name, :url, :songs, :genres
    @@artists = []
    alias :all :songs
    
    #Instance methods 
    
    def initialize 
        @@artists << self 
        self.songs = []
        self.genres = []
        #puts @@artists
    end
    
   
    
    def add_song(song)
        if self.songs == nil
            self.songs = []   
        end
        self.songs.push song
    end
    
    def add_songs(songs)
        puts songs
        [songs].flatten.each do |song|
           parts = song.name.split(" - ")
    
          artist = Artist.new
          artist.name = parts.first
    
          song = Song.new
          song.name = parts.last
          song.artist = artist
    
          self.songs << song
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