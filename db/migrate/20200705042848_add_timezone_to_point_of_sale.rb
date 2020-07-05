class AddTimezoneToPointOfSale < ActiveRecord::Migration[6.0]
  def change
    add_column :point_of_sales, :timezone, :string
    
    PointOfSale.update_all(timezone: "Santiago")
  end
end
