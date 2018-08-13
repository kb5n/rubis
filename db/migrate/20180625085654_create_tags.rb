class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :identifier, limit: 128, null: false
      t.references :user

      t.timestamps
    end
    add_index :tags, :identifier, unique: true
  end
end
