class AddDeletedToModels < ActiveRecord::Migration[6.0]
  def change
  	add_column :adresses, :deleted, :boolean
  	add_column :clients, :deleted, :boolean
  	add_column :users, :deleted, :boolean

  	Adress.update_all(deleted: false)
  	Client.update_all(deleted: false)
  	Delivery.update_all(deleted: false)
  	DeliveryType.update_all(deleted: false)
  	PaymentType.update_all(deleted: false)
  	PointOfSale.update_all(deleted: false)
  	Product.update_all(deleted: false)
  	Sale.update_all(deleted: false)
  	ShoppingCart.update_all(deleted: false)
  	Subtype.update_all(deleted: false)
  	Timeblock.update_all(deleted: false)
  	Type.update_all(deleted: false)
  	User.update_all(deleted: false)
  end 

end
