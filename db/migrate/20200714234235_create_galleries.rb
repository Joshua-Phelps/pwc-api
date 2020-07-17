class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.string :address
      t.string :name 
      t.integer :max_paintings
      t.string :email
      t.string :phone_number
      
      t.timestamps
    end
  end
end
