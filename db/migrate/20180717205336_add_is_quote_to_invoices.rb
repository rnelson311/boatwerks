class AddIsQuoteToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :is_quote, :boolean
  end
end
