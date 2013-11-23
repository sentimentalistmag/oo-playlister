class Song
   attr_accessor :name, :genre, :artist
    
    def to_s
       "#{self.artist} - #{self.name} [#{self.genre}]"    
    end
end