class Type < ApplicationRecord
has_many :subtypes, inverse_of: :type, dependent: :destroy
after_initialize :set_defaults, unless: :persisted?

validates :name, presence: true
validates :deleted, inclusion: { in: [true, false] }

private
  def set_defaults
    self.deleted = false if self.deleted.nil?
  end
end
