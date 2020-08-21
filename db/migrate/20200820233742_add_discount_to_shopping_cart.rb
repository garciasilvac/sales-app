class AddDiscountToShoppingCart < ActiveRecord::Migration[6.0]
  def up
    add_column :shopping_carts, :discount, :float
    ShoppingCart.update_all(discount:0)
  end
  def down
    remove_column :shopping_carts, :discount, :float
  end
  
end
