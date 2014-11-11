class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.text :title
      t.integer :listing_id, null: false

      t.timestamps null: false
    end

    add_index :images, :listing_id
  end
end
