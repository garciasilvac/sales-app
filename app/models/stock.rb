class Stock < ApplicationRecord
  belongs_to :stockable, polymorphic: true
  has_many :childs, class_name: "Stock", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Stock", optional: true
  after_initialize :set_defaults, unless: :persisted?

  private
    def set_defaults
      self.deleted = false if self.deleted.nil?
    end
end
