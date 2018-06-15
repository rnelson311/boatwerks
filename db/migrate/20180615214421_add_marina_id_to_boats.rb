class AddMarinaIdToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :marina_id, :integer
  end
end
