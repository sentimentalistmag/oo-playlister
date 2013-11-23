class Genre
    attr_accessor :artists, :name, :url, :songs
    $genres = []
    def initialize
        $genres << self
    end
    
    def reset_all_genres
        $genres = []
    end
end