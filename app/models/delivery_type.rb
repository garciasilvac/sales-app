class DeliveryType < ApplicationRecord
    has_many :sales, inverse_of: :delivery_type
    after_initialize :set_defaults, unless: :persisted?

    validates :name, presence: true
    validates :deleted, inclusion: { in: [true, false] }
    validates :requires_delivery, inclusion: { in: [true, false] }

    private
        def set_defaults
            self.deleted = false if self.deleted.nil?
            self.requires_delivery = false if self.requires_delivery.nil?
        end
end
