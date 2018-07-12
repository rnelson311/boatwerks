class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.references :invoice, foreign_key: true
      t.string :description
      t.float :unit_cost
      t.integer :quantity
      t.float :discount
      t.float :amount

      t.timestamps
    end
  end
end
