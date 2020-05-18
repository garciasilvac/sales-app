json.extract! shopping_cart, :id, :sale_id, :product_id, :product_q, :deleted, :subtotal, :created_at, :updated_at
json.url shopping_cart_url(shopping_cart, format: :json)
