class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.references :client, foreign_key: true
      t.references :boat, foreign_key: true
      t.date :date
      t.float :tax
      t.float :subtotal
      t.float :total
      t.boolean :is_payed

      t.timestamps
    end
  end
end
