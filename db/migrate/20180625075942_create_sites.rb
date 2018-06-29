class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :title, null: false
      t.string :description
      t.string :copyright, null: false
      t.date :started_at, null: false

      t.timestamps
    end
  end
end
