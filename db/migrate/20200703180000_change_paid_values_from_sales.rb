class ChangePaidValuesFromSales < ActiveRecord::Migration[6.0]
  def change
    ##changing all app boolean values from nil to correct value 
    ## controller changes as well to prevent this from creation
    Adress.where(deleted:nil).update_all(deleted:false)
    Client.where(deleted:nil).update_all(deleted:false)
    Delivery.where(deleted:nil).update_all(deleted:false)
    Delivery.where(delivered:nil).update_all(delivered:false)
    Delivery.where(delivered:false).update_all(successful:nil)
    Delivery.where({delivered:true,successful:nil}).update_all(successful:true)
    DeliveryType.where(deleted:nil).update_all(deleted:false)
    DeliveryType.where(requires_delivery:nil).update_all(requires_delivery:false)
    PaymentType.where(deleted:nil).update_all(deleted:false)
    PointOfSale.where(deleted:nil).update_all(deleted:false)
    Product.where(deleted:nil).update_all(deleted:false)
    Sale.where(deleted:nil).update_all(deleted:false)
    Sale.where(paid:nil).update_all(paid:false)
    ShoppingCart.where(deleted:nil).update_all(deleted:false)
    Subtype.where(deleted:nil).update_all(deleted:false)
    Timeblock.where(deleted:nil).update_all(deleted:false)
    Type.where(deleted:nil).update_all(deleted:false)
    User.where(deleted:nil).update_all(deleted:false)

  end
end
