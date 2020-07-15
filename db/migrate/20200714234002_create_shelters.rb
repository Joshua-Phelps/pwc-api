class CreateShelters < ActiveRecord::Migration[6.0]
  def change
    create_table :shelters do |t|
      t.string :external_id
      t.string :name 
      t.string :address 
      t.string :phone_number 
      t.timestamps
    end
  end
end
