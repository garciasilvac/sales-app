class Stock < ApplicationRecord
  belongs_to :stockable, polymorphic: true
  has_many :childs, class_name: "Stock", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Stock", optional: true
  after_initialize :set_defaults, unless: :persisted?

  validates :quantity, numericality:{only_integer:true}
  validates :sku, presence: true
  validates :deleted, inclusion: { in: [true, false] }
  validates :stockable, presence: true

  private
    def set_defaults
      self.deleted = false if self.deleted.nil?
    end
end
