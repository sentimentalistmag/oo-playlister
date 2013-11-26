class Genre
    extend Findable
    attr_accessor :artists, :name, :url, :songs
    @@genres = []
    def initialize
        self.name = ''
        self.artists = []
        self.songs = []
        @@genres << self
    end
    
    def self.reset_all
        @@genres.clear
    end
    
    def url
       self.name.downcase.gsub(' ', '-') + '.html' 
    end
    
    def self.all
       @@genres 
    end
    
    def self.count 
        return @@genres.count
    end
end