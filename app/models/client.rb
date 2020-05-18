class Client < ApplicationRecord
has_many :adresses, dependent: :destroy
has_many :sales
after_initialize :set_defaults, unless: :persisted?

 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :phone_countrycode, presence: true
 validates :phone_number, presence: true
 validates :email, presence: true
 validates :age, presence: true
 validates :sex, presence: true
 
def full_name
	"#{first_name.first}. #{last_name}"
end

 private
  def set_defaults
    self.phone_countrycode = 56 if self.phone_countrycode.nil?
  end
end