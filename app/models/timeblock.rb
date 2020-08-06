class Timeblock < ApplicationRecord
    after_initialize :set_defaults, unless: :persisted?

    validates :name, presence: true
    validates :deleted, inclusion: { in: [true, false] }
    validates :start_time, presence: true
    validates :end_time, presence: true

    private
        def set_defaults
            self.deleted = false if self.deleted.nil?
        end
end
