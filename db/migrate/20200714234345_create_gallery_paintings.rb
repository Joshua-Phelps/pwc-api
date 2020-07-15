class CreateGalleryPaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :gallery_paintings do |t|
      t.integer :gallery_id
      t.integer :painting_id
      t.boolean :currently_displayed
      t.integer :card_stock
      t.timestamps
    end
  end
end
