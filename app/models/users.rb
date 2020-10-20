class User < ActiveRecord::Base
    has_many :plant_marriages
    has_many :plants, through: :plant_marriages

    # def my_plants
    #     self.plants
    # end

    
end