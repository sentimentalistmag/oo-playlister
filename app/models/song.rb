class Song
    extend Findable
    attr_accessor :name, :genre, :artist
    @@songs = []
    
    def initialize
       @@songs << self 
    end
    #'Miley Cyrus - We Can\'t Stop [Pop]'
    def to_s
       "#{self.artist.name} - #{self.name} [#{self.genre.name.capitalize}]"    
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
    
    def url
       self.name.gsub(' ', '-').downcase + '.html' 
    end
end