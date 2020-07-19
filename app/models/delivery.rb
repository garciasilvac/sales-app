class Delivery < ApplicationRecord
  belongs_to :sale
  after_initialize :set_defaults, unless: :persisted?

  validates :sale_id, presence: true
  validates :adress_id, presence: true
  validates :sched_date, presence: true
  validates :sched_timeblock, presence: true

	def get_schedtb_name
		self.sched_timeblock.nil? ? "Not Defined" : Timeblock.find(self.sched_timeblock).name
	end

	def get_adress
		self.adress_id.nil? ? "Not Defined" : Adress.find(self.adress_id)
  end
  def get_client
		Sale.find(self.sale_id).client.nil? ? "Not Defined" : Client.find(Sale.find(self.sale_id).client.id)
  end
  def get_products
		Sale.find(self.sale_id).shopping_carts
	end

	def get_realtb_name
		self.real_timeblock.nil? ? "Not Defined" : Timeblock.find(self.real_timeblock).name
  end

  def self.gmap_roundtrip(deliveries)
    coords = ""
    deliveries.each do |d|
      coords += CGI::escape("via:#{d.get_adress.full_adress}")+"%7C"
      ##coords += "via:#{d.get_adress.latitude},#{d.get_adress.longitude}%7C"
    end 
    "https://www.google.com/maps/dir/?api=1&origin=-33.4181376,-70.59449190000001&destination=-33.4181376,-70.59449190000001&waypoints="+coords+"&key="+Rails.application.credentials[Rails.env.to_sym][:gmapsapi][:key]
  end

  def self.get_adresses
    Adress.group(:adr_county).count
  end

  def self.total_q(deliveries)
    total = 0
    deliveries.each do |d|
      d.get_products.each do |p|
        total+=p.product_q
      end
    end
    total
  end

 private
  def set_defaults
    self.sched_date = Time.now.utc.to_date if self.sched_date.nil?
    self.delivered = false if self.delivered.nil?
    self.deleted = false if self.deleted.nil?
    self.successful = false if self.successful.nil?
    self.price = 0 if self.price.nil?
  end

end
