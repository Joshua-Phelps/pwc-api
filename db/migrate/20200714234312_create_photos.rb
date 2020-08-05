class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :animal_id
      t.string :original_url
      t.string :size
      t.string :file_path
      t.string :google_drive_url
      t.timestamps
    end
  end
end
