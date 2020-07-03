class DeliveryType < ApplicationRecord
    after_initialize :set_defaults, unless: :persisted?
    private
        def set_defaults
            self.deleted = false if self.deleted.nil?
            self.requires_delivery = false if self.requires_delivery.nil?
        end
end
