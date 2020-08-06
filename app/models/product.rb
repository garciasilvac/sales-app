class Product < ApplicationRecord
  has_many :stocks, as: :stockable, dependent: :destroy
  belongs_to :subtype
  has_many :shopping_carts, inverse_of: :product
  has_many :sales, :through => :shopping_carts
  has_one_attached :product_image
  after_initialize :set_defaults, unless: :persisted?
  
  validates :name, presence: true
  validates :price, numericality:{greater_than_or_equal_to: 0}
  validates :deleted, inclusion: { in: [true, false] }
  validates :subtype, presence: true



private
  def set_defaults
    self.deleted = false if self.deleted.nil?
  end
end
