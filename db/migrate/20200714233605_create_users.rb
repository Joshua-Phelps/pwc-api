class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.integer :permission_level, :default => 1
      t.string :password_reset_token 
      t.datetime :password_reset_sent_at

      t.timestamps
    end
  end
end
