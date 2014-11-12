class CreateBookingRequests < ActiveRecord::Migration
  def change
    create_table :booking_requests do |t|
      t.date :starts_on
      t.date :ends_on
      t.integer :guest_number
      t.integer :listing_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
