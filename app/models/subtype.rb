class Subtype < ApplicationRecord
  belongs_to :type
  has_many :products
  after_initialize :set_defaults, unless: :persisted?
  
  validates :type_id, presence: true
  validates :name, presence: true
  
  def full_subtype
 	self.type.name+" - "+self.name
  end

private
  def set_defaults
    self.deleted = false if self.deleted.nil?
  end
  
end
