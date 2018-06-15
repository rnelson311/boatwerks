class AddColumnstoBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :configuration, :string
    add_column :boats, :fuel_type, :string
    add_column :boats, :propulsion, :string
    add_column :boats, :engine, :string
    add_column :boats, :engine_count, :integer
    add_column :boats, :hailing_port, :string
  end
end
