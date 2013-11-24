class Genre
    extend Findable
    attr_accessor :artists, :name, :url, :songs
    @@genres = []
    def initialize
        @@genres << self
    end
    
    def self.reset_all
        @@genres.clear
    end
    
    def url
       self.name.downcase.gsub(' ', '-') + '.html' 
    end
end