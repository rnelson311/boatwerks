class AddAddressInfoToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :address1, :string
    add_column :clients, :address2, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :clients, :zip_code, :string
  end
end
