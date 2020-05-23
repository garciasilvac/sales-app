class Product < ApplicationRecord
  belongs_to :subtype
  has_many :shopping_carts
  has_many :sales, :through => :shopping_carts
  has_one_attached :product_image
  after_initialize :set_defaults, unless: :persisted?
  
validates :name, presence: true
validates :price, presence: true

private
  def set_defaults
    self.deleted = false if self.deleted.nil?
  end
end
