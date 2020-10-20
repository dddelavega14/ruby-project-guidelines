class Plant < ActiveRecord::Base
    has_many :plant_marriages
    has_many :users, through: :plant_marriages
end