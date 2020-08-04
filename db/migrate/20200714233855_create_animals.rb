class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :animal_type
      t.string :name
      t.integer :external_id
      t.text :description, :limit => 2000
      t.string :age
      t.string :gender
      t.integer :shelter_id
      t.integer :canvas_photo_id
      t.integer :profile_photo_id
      t.boolean :canvas_printed, :default => false
      t.timestamps
    end
  end
end
