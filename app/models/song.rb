class Song
    extend Findable
    attr_accessor :name, :artist
    @@songs = []
    
    def initialize
        @@songs << self 
        self.name = ''
        self.artist = Artist.new
        self.genre = Genre.new
    end
    #'Miley Cyrus - We Can\'t Stop [Pop]'
    def to_s
       "#{self.artist.name} - #{self.name} [#{self.genre.name.capitalize}]"    
    end
    
    def genre
        @genre
    end
    
    def genre=(genre)
        @genre = genre
        if genre.songs !=nil
            genre.songs.push self
        end

    end
        
    def url
       self.name.gsub(' ', '-').downcase + '.html' 
    end
    
    def self.reset_all
       @@songs.clear 
    end
    
    def self.count
       @@songs.count 
    end
    
    def self.all
       @@songs 
    end
    
   
end