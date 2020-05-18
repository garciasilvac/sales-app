class Sale < ApplicationRecord
  belongs_to :client
  has_many :shopping_carts
  has_many :products, :through => :shopping_carts
  after_initialize :set_defaults, unless: :persisted?

  validates :client_id, presence: true
  validates :payment_type_id, presence: true
  validates :delivery_type_id, presence: true


 private
  def set_defaults
    self.sale_datetime = DateTime.now if self.sale_datetime.nil?
  end

end
