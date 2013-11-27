module Findable
    def find_by_name(name)
        all.each do |thing|
            #puts "Thing is " + thing.name
            if thing.name == name
                #puts 'Found It'
                return thing
            end
        end
        nil
    end
    
    def create_by_name(name)
       self.new.tap {|thing| thing.name = name}
       
    end
    
  
    def ==(thing)
       true
        #return thing.name == self.name 
    end
end
