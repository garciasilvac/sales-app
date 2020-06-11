class PointOfSale < ApplicationRecord
  has_many :adresses, as: :adressable, dependent: :destroy


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

end
