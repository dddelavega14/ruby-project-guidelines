class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :type_of_plant
      t.string :size
      t.text :caring_instructions
      t.boolean :alive
    end
  end
end
