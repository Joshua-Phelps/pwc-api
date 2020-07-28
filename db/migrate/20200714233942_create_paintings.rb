class CreatePaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :paintings do |t|
      t.integer :animal_id
      t.integer :paint_location_id
      t.integer :gallery_id
      t.string :painting_url
      t.string :painting_status
      t.string :painter
      t.integer :card_stock

      t.timestamps
    end
  end
end
