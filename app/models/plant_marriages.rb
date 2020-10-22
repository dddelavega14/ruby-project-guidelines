class PlantMarriage < ActiveRecord::Base
    belongs_to :user
    belongs_to :plant



    def add_hint(helpful_hint)
        self.helpful_hints << helpful_hint 
    end

end
