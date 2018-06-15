class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :manufacturer
      t.string :model
      t.string :construction
      t.string :boat_type
      t.string :identification
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
