class AddInfoColumnToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :info, :text
  end
end
