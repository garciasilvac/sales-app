class CostClass < ApplicationRecord
  has_many :childs, class_name: "CostClass", foreign_key: "parent_id"
  belongs_to :parent, class_name: "CostClass", optional: true
  has_many :costs, inverse_of: :cost_class
  after_initialize :set_defaults, unless: :persisted?

  validates :parent, presence:true
  validates :deleted, inclusion: { in: [true, false] }
  validates :name, presence:true

  private
    def set_defaults
      self.deleted = false if self.deleted.nil?
    end
end
