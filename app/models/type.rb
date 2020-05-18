class Type < ApplicationRecord
has_many :subtypes, dependent: :destroy;
after_initialize :set_defaults, unless: :persisted?

validates :name, presence: true

private
  def set_defaults
    self.deleted = false if self.deleted.nil?
  end
end
