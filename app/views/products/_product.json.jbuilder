json.extract! product, :id, :name, :subtype_id, :price, :deleted, :created_at, :updated_at
json.url product_url(product, format: :json)
