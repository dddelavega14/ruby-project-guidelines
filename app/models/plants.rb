class Plant < ActiveRecord::Base
    has_many :plant_marriages
    has_many :users, through: :plant_marriages
    
    def add_plant(name)
        PlantMarriage.create(user: @this_user, plant: name, helpful_hints: “”)
        my_plants
    end
    
    # def self.names
    #     self.all.map {|user| user.name}
    # end

end