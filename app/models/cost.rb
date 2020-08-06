class Cost < ApplicationRecord
    belongs_to :cost_class
    has_one_attached :document_image
    after_initialize :set_defaults, unless: :persisted?
    
    validates :name, presence:true
    validates :value, numericality:{ greater_than: 0 }
    validates :deleted, inclusion: { in: [true, false] }
    validates :cost_datetime, presence:true
    validates :paid, inclusion: { in: [true, false] }
    validates :cost_class, presence: true
    validates :document_id, presence: true, on: :step_2

    private
    def set_defaults
      self.deleted = false if self.deleted.nil?
      self.paid = false if self.paid.nil?
      self.cost_datetime = DateTime.now if self.cost_datetime.nil?
    end
end
