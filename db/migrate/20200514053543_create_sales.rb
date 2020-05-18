class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.datetime :sale_datetime
      t.references :client, null: false, foreign_key: true
      t.bigint :total_amount
      t.boolean :paid
      t.references :payment_type, null: false, foreign_key: true
      t.references :delivery_type, null: false, foreign_key: true
      t.boolean :deleted

      t.timestamps
    end
  end
end
