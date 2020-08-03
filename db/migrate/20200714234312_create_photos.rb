class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :animal_id
      t.string :url
      t.string :size
      t.string :google_drive_path
      t.boolean :profile
      t.boolean :bkgd_removed, :default => false
      t.timestamps
    end
  end
end
