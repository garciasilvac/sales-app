class CreatePointOfSales < ActiveRecord::Migration[6.0]
  def change
    create_table :point_of_sales do |t|
      t.references :adressable, polymorphic: true, null: false
      t.string :name
      t.boolean :deleted

      t.timestamps
    end
  end
end
