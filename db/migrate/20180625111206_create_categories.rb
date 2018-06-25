class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description
      t.string :identifier, null: false

      t.timestamps
    end
    add_index :categories, :identifier, unique: true
  end
end
