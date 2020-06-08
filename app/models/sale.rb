class Sale < ApplicationRecord
  belongs_to :client
  has_many :shopping_carts, dependent: :destroy
  has_many :products, :through => :shopping_carts
  has_many :deliveries, dependent: :destroy
  after_initialize :set_defaults, unless: :persisted?

  validates :sale_datetime, presence: true


  def delivery_type
    DeliveryType.find(self.delivery_type_id)
  end

 private
  def set_defaults
    self.sale_datetime = DateTime.now if self.sale_datetime.nil?
  end

end
