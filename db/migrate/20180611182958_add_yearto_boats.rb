class AddYeartoBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :year, :string
  end
end
