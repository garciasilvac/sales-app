class Adress < ApplicationRecord
after_initialize :set_defaults, unless: :persisted?
geocoded_by :full_adress
after_validation :geocode, if: :adress_changed?
belongs_to :adressable, polymorphic: true

validates :street, presence: true, length: {minimum: 3}
validates :str_number,presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
validates :adr_zip, numericality: {only_integer: true, greater_than_or_equal_to: 0}, allow_blank:true
validates :adr_county, presence: true, length: {minimum: 3}
validates :adr_state, presence: true, length: {minimum: 2}
validates :adr_country, presence: true, length: {minimum: 3}
validates :deleted, inclusion: { in: [true, false] }
validates :adressable, presence: true



def full_adress
	self.street+" "+self.str_number.to_s+", "+self.adr_county+", "+self.adr_state
end

def adress_changed?
	street_changed? || str_number_changed? || adr_county_changed? || adr_state_changed?
end

def gmap_show
	"https://www.google.com/maps/search/?api=1&query=#{self.latitude},#{self.longitude}"
end

def gmap_dir
	"https://www.google.com/maps/dir/?api=1&destination=#{self.latitude},#{self.longitude}"
end

private
  def set_defaults
	self.adr_state = 'RM' if self.adr_state.nil?
	self.adr_country = 'Chile' if self.adr_country.nil?
	self.deleted = false if self.deleted.nil?
  end
end
