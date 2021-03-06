class PointOfSale < ApplicationRecord
	has_one :adress, as: :adressable,inverse_of: :point_of_sale, dependent: :destroy
	after_initialize :set_defaults, unless: :persisted?

	validates :name, presence: true
	validates :deleted, inclusion: { in: [true, false] }
	validates :timezone, presence: true


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
