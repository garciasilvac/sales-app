class AddColumnsToDelivery < ActiveRecord::Migration[6.0]
  def change
  	add_column :deliveries, :successful, :boolean
  	add_column :deliveries, :driver_comment, :text
  end
end
