class User < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :crypted_password
      t.string :salt
      t.string :name, :null => false
      t.string :remember_me_token, :default => nil
      t.datetime :remember_me_token_expires_at, :default => nil
      t.timestamps :null => false
    end
    add_index :users, :email, unique: true
    add_index :users, :remember_me_token
  end
end
