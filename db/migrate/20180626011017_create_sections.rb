class CreateSections < ActiveRecord::Migration[5.2]
  # rubocop:disable Metrics/AbcSize
  def change
    create_table :sections do |t|
      t.references :article
      t.integer :content_type
      t.integer :sequence, null: false
      t.string :title
      t.text :description
      t.string :image_id
      t.string :image_filename
      t.string :image_content_size
      t.string :image_content_type
      t.text :url
      t.string :og_site_name
      t.string :og_title
      t.text :og_description
      t.text :og_image
      t.timestamps
    end
  end
  # rubocop:enable Metrics/AbcSize
end
