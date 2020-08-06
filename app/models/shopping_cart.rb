class ShoppingCart < ApplicationRecord
    belongs_to :sale
    belongs_to :product
    after_initialize :set_defaults, unless: :persisted?

    
    validates :product_q, numericality:{only_integer:true, greater_than: 0}
    validates :deleted, inclusion: { in: [true, false] }


    def get_sale_datetime
        self.sale.sale_datetime
    end

    private
    def set_defaults
        self.deleted = false if self.deleted.nil?
    end
end
