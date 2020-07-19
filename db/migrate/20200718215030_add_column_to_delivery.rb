class AddColumnToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :price, :bigint
    Delivery.update_all(price:0)
  end
end
