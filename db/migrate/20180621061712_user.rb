class User < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :identifier, null: false
      t.string :email, limit: 256, null: false
      t.string :name, null: false
      t.integer :role_type, null: false, default: 0 #guest
      t.string :blog_title, null: false
      t.string :blog_description
      t.date :blog_started_at, null: false
      t.string :crypted_password
      t.string :salt
      t.string :remember_me_token, default: nil
      t.datetime :remember_me_token_expires_at, default: nil
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :identifier
  end
end
