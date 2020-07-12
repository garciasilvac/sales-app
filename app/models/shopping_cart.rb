class ShoppingCart < ApplicationRecord
    belongs_to :sale
    belongs_to :product
    after_initialize :set_defaults, unless: :persisted?

    validates :sale_id, presence: true
    validates :product_id, presence: true

    #def get_sale
    #    self.sale.sale_datetime
    #end
    

    private
    def set_defaults
        self.deleted = false if self.deleted.nil?
    end
end
