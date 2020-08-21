class AddDiscountToShoppingCart < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :discount, :float
  end

  def up
    ShoppingCart.update_all(discount:0)
  end
  
end
