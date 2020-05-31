class Sale < ApplicationRecord
  belongs_to :client
  has_many :shopping_carts, dependent: :destroy
  has_many :products, :through => :shopping_carts
  has_many :deliveries, dependent: :destroy
  after_initialize :set_defaults, unless: :persisted?

  validates :sale_datetime, presence: true, on: :create_step_1
  validates :client_id, presence: true, on: :create_step_1
  validates_associated :delivery_type_id, presence: true, on: :create_step_2
  validates_associated :payment_type_id, presence: true, on: :create_step_3

  def delivery_type
    DeliveryType.find(self.delivery_type_id)
  end

 private
  def set_defaults
    self.sale_datetime = DateTime.now.utc if self.sale_datetime.nil?
  end

end
