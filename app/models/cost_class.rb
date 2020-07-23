class CostClass < ApplicationRecord
  has_many :childs, class_name: "CostClass", foreign_key: "parent_id"
  belongs_to :parent, class_name: "CostClass", optional: true
  after_initialize :set_defaults, unless: :persisted?


  private
    def set_defaults
      self.deleted = false if self.deleted.nil?
    end
end
