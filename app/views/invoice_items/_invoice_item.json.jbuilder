json.extract! invoice_item, :id, :invoice_id, :description, :unit_cost, :quantity, :discount, :amount, :created_at, :updated_at
json.url invoice_item_url(invoice_item, format: :json)
