class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description
      t.string :identifier, limit: 128, null: false
      t.references :user

      t.timestamps
    end
    add_index :categories, :identifier, unique: true
  end
end
