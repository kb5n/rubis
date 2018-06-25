class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :identifier, null: false

      t.timestamps
    end
    add_index :tags, :identifier, unique: true
  end
end
