class Adress < ApplicationRecord
after_initialize :set_defaults, unless: :persisted?
geocoded_by :full_adress
after_validation :geocode, if: :adress_changed?
belongs_to :adressable, polymorphic: true



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
	self.phone_countrycode = 56 if self.phone_countrycode.nil?
	self.deleted = false if self.deleted.nil?
  end
end
