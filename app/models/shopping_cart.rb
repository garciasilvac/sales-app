class ShoppingCart < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :sale_id, presence: true
  validates :product_id, presence: true
end
