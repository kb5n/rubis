class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.references :article
      t.integer :content_type
      t.string :title
      t.integer :sequence, null: false
      t.text :description
      t.text :url
      t.text :image_url
      t.string :source
      t.timestamps
    end
  end
end
