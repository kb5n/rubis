class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :identifier, null: false
      t.integer :status, null: false, default: 0 # draft
      t.datetime :published_at, default: -> { 'NOW()' }, null: false
      t.references :category
      t.references :user

      t.timestamps
    end
    add_index :articles, :identifier, unique: true
  end
end
