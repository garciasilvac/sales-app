class Timeblock < ApplicationRecord
    after_initialize :set_defaults, unless: :persisted?
    private
        def set_defaults
            self.deleted = false if self.deleted.nil?
        end
end
