class Subtype < ApplicationRecord
  belongs_to :type
  has_many :products, inverse_of: :subtype
  after_initialize :set_defaults, unless: :persisted?
  
  validates :name, presence: true
  validates :deleted, inclusion: { in: [true, false] }
  validates :type, presence: true
  
  def full_subtype
 	self.type.name+" - "+self.name
  end

private
  def set_defaults
    self.deleted = false if self.deleted.nil?
  end
  
end
