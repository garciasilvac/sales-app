class Cost < ApplicationRecord
    belongs_to :cost_class
    has_one_attached :document_image
    after_initialize :set_defaults, unless: :persisted?
    

    private
    def set_defaults
      self.deleted = false if self.deleted.nil?
      self.paid = false if self.paid.nil?
      self.cost_datetime = DateTime.now if self.cost_datetime.nil?
    end
end
