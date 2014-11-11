class AddMaxGuestNumberToListing < ActiveRecord::Migration
  def change
    add_column :listings, :max_guest_number, :integer, default: 1
  end
end
