class UpdateInvoices
  def initialize(params)
    @invoice = params[:invoice]
    @invoice_items = params[:invoice_items]
  end

  def perform
    update_invoice_item_totals
    update_invoice_totals
  end

  private

  def update_invoice_item_totals
    @invoice_items.each do |line_item|
      line_item.amount = (line_item.quantity * line_item.unit_cost) - line_item.discount
      line_item.save!
    end
  end

  def update_invoice_totals
    tax = 1 + (@invoice.tax / 100)
    @invoice.subtotal = @invoice.invoice_items.sum(:amount)
    @invoice.total = @invoice.subtotal * tax
    @invoice.save!
  end
end
