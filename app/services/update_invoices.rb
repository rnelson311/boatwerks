class UpdateInvoices
  def initialize(invoice)
    @invoice = invoice
  end

  def call
    update_invoice_item_totals
    update_invoice_totals
  end

  private

  def update_invoice_item_totals
    @invoice.invoice_items.each do |invoice_item|
      invoice_item.amount = (invoice_item.unit_cost * invoice_item.quantity) - invoice_item.discount
      invoice_item.save
    end
  end

  def update_invoice_totals
    tax = 1 + (@invoice.tax / 100)
    @invoice.subtotal = @invoice.invoice_items.sum(:amount)
    @invoice.total = @invoice.subtotal * tax
    @invoice.save!
  end
end
