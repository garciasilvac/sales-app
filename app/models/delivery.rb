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

 private
  def set_defaults
    self.sched_date = Time.now.utc.to_date if self.sched_date.nil?
    self.delivered = false if self.sched_date.nil?
  end

end
