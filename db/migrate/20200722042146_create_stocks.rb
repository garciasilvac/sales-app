class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.references :stockable, polymorphic: true
      t.bigint :quantity
      t.string :SKU
      t.boolean :deleted

      t.timestamps
    end
  end
end
