class AddReferenceToStock < ActiveRecord::Migration[6.0]
  def change
    add_reference :stocks, :parent
  end
end
