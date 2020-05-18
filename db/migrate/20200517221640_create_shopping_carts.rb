class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :product_q
      t.boolean :deleted
      t.bigint :subtotal

      t.timestamps
    end
  end
end
