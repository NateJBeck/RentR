class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.string :location
      t.integer :bedrooms
      t.date :starts_on
      t.date :ends_on
      t.text :description
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
