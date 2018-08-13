class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :identifier, limit: 128, null: false
      t.integer :status, default: 0, null: false
      t.datetime :published_at, default: Time.current, null: false
      t.references :category
      t.references :user

      t.timestamps
    end
    add_index :articles, :identifier, unique: true
  end
end
