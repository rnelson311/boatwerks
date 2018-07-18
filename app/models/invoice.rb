class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :boat
  has_many :invoice_items, dependent: :destroy
  accepts_nested_attributes_for :invoice_items, allow_destroy: true
  default_scope { order(:id) }

  def clone
    invoice = Invoice.new
    invoice.client = self.client
    invoice.boat = self.boat
    invoice.date = self.date
    invoice.is_payed = false
    invoice.is_quote = false
    invoice.tax = self.tax

    invoice.invoice_items.clear
    self.invoice_items.each do |i|
      item = InvoiceItem.new
      item.description = i.description
      item.unit_cost = i.unit_cost
      item.quantity = i.quantity
      item.discount = i.discount
      item.amount = i.amount
      invoice.invoice_items << item
    end

    invoice.subtotal = self.subtotal
    invoice.total =  self.total
    invoice.save!

    invoice
  end
end
