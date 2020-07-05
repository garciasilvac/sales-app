class PointOfSale < ApplicationRecord
	has_many :adresses, as: :adressable, dependent: :destroy
	after_initialize :set_defaults, unless: :persisted?

  	def formatted_name(input = :reverse)
		case input
		when :compact
			"#{name}"
		when :reverse
			"#{name}"
		when :full
			"#{name}"
		else
			"Not a valid format :("
		end
	end

    private
        def set_defaults
			self.deleted = false if self.deleted.nil?
        end

end
