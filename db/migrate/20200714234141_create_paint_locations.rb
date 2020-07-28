class CreatePaintLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :paint_locations do |t|
      t.hstore :address
      t.string :name 
      t.string :phone_number
      t.string :email 
      
      t.timestamps
    end
  end
end
