class Artist
    attr_accessor :name, :url, :songs
    $artists = []
    
    def initialize 
       $artists << self 
    end
    
    def reset_all_genres
        $arists.clear
    end
end