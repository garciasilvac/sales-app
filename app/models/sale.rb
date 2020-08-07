class Sale < ApplicationRecord
  belongs_to :client
  # belongs_to :delivery_type
  # belongs_to :payment_type
  has_many :shopping_carts, inverse_of: :sale, dependent: :destroy
  has_many :products, :through => :shopping_carts
  has_many :deliveries, inverse_of: :sale, dependent: :destroy
  after_initialize :set_defaults, unless: :persisted?

  validates :sale_datetime, presence: true
  validates :total_amount, numericality: {greater_than_or_equal_to: 0}
  validates :paid, inclusion: { in: [true, false] }
  validates :deleted, inclusion: { in: [true, false] }
  with_options on: :step_2 do |s|
    s.validate :reference_existance_delivery_type
  end 
  with_options on: :step_3 do |s|
    s.validate :reference_existance_payment_type
  end 

  def reference_existance_delivery_type
    if delivery_type_id.nil? || !(DeliveryType.exists?(id: delivery_type_id))
      errors.add(:delivery_type_id, :required)
    end
  end
  def reference_existance_payment_type
    if payment_type_id.nil? || !(PaymentType.exists?(id: payment_type_id))
      errors.add(:payment_type_id, :required)
    end
  end

  def delivery_type
    DeliveryType.find(self.delivery_type_id) unless self.delivery_type_id.nil?
  end

 private
  def set_defaults
    self.sale_datetime = DateTime.now if self.sale_datetime.nil?
    self.deleted = false if self.deleted.nil?
    self.paid = false if self.paid.nil?
    self.total_amount = 0 if self.total_amount.nil?
  end

end
