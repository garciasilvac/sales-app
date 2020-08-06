class PaymentType < ApplicationRecord
    has_many :sales, inverse_of: :payment_type
    after_initialize :set_defaults, unless: :persisted?

    validates :name, presence: true
    validates :deleted, inclusion: { in: [true, false] }
    

    private
        def set_defaults
            self.deleted = false if self.deleted.nil?
        end
end
