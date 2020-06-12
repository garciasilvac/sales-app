class AddRequiresDeliveryToDeliveryType < ActiveRecord::Migration[6.0]
  def change
  	add_column :delivery_types, :requires_delivery, :boolean
  end
end
