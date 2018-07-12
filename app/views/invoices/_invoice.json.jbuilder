json.extract! invoice, :id, :client_id, :boat_id, :date, :tax, :subtotal, :total, :is_payed, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
