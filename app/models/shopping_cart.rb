class ShoppingCart < ApplicationRecord
    belongs_to :sale
    belongs_to :product
    after_initialize :set_defaults, unless: :persisted?

    
    validates :product_q, numericality:{only_integer:true, greater_than: 0}
    validates :deleted, inclusion: { in: [true, false] }
    validates :discount, numericality:{greater_than_or_equal_to: 0, less_than_or_equal_to: 100}


    def get_sale_datetime
        self.sale.sale_datetime
    end

    private
    def set_defaults
        self.deleted = false if self.deleted.nil?
        self.discount = 0 if self.discount.nil?
    end
end
