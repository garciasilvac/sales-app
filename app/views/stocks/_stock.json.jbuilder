json.extract! stock, :id, :stockable, :parent_id, :quantity, :SKU, :deleted, :created_at, :updated_at
json.url stock_url(stock, format: :json)
