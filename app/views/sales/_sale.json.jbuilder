json.extract! sale, :id, :sale_datetime, :client_id, :total_amount, :paid, :payment_type_id, :delivery_type_id, :deleted, :created_at, :updated_at
json.url sale_url(sale, format: :json)
