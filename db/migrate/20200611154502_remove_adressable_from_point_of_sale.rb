class RemoveAdressableFromPointOfSale < ActiveRecord::Migration[6.0]
  def change
  	remove_column :point_of_sales, :adressable_id, :bigint
  	remove_column :point_of_sales, :adressable_type, :string
  end
end
