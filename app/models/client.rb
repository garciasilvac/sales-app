class Client < ApplicationRecord
include PgSearch::Model
has_many :adresses, as: :adressable, dependent: :destroy
has_many :sales
after_initialize :set_defaults, unless: :persisted?

pg_search_scope :search_by_name_and_email, :against => [:first_name, :middle_name, :last_name, :email],
    using: {
      :tsearch => {:prefix => true}
    }

 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :phone_countrycode, presence: true, numericality:{only_integer:true, greater_than_or_equal_to: 0}
 validates :phone_number, presence: true, numericality:{only_integer:true, greater_than_or_equal_to: 0}
 validates :email, uniqueness: true, confirmation: true, unless: -> { email.blank? }
 validates :email_confirmation, presence: true, unless: -> { email.blank? }
 validates :birthdate, presence: true
 validates :sex, presence: true
 validates :deleted, inclusion: { in: [true, false] }
 
 
def formatted_name(input = :reverse)
	case input
	when :compact
		"#{first_name.first}. #{last_name}"
	when :reverse
		"#{last_name}, #{first_name}"
	when :full
		if middle_name.nil? || middle_name.blank?
			"#{first_name} #{last_name}"
		else
			"#{first_name} #{middle_name} #{last_name}"
		end
	else
		"Not a valid format :("
	end
end

def age
	now = Time.now.utc.to_date
	now.year - birthdate.year - ((now.month < birthdate.month) ? 1 : ((now.month == birthdate.month && now.day < birthdate.day) ? 1 : 0 ))
end

 private
  def set_defaults
	self.phone_countrycode = 56 if self.phone_countrycode.nil?
	self.deleted = false if self.deleted.nil?
  end
end