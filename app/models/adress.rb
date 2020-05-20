class Adress < ApplicationRecord
belongs_to :client

validates :client_id, presence: true

def full_adress
	self.street+" "+self.str_number.to_s+", "+self.adr_county+", "+self.adr_state
end

end
