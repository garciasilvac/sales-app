class AddAdressIdToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_reference :deliveries, :adress, foreign_key: true
  end
end
