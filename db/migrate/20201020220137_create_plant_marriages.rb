class CreatePlantMarriages < ActiveRecord::Migration[6.0]
  def change
    create_table :plant_marriages do |t|
      t.integer :plant_id
      t.integer :user_id
      t.text :helpful_hints
    end
  end
end
