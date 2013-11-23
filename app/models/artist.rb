class Artist
    extend Findable
    attr_accessor :name, :url, :songs, :genres
    @@artists = []
    
    def initialize 
       @@artists.push self 
    end
    
    def reset_all
        @@artists.clear
    end
    
    def add_song(song)
         self.songs.push song
    end
    
    def self.all
       @@artists 
    end
    
    def self.count 
        return @@artists.count
    end
    
    def url
       self.name.gsub(' ', '-').downcase + '.html' 
    end
end