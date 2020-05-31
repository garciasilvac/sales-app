class RemoveNullConstraintToSalesPaymentTypeAndDeliveryType < ActiveRecord::Migration[6.0]
  def change
  	change_column_null(:sales, :payment_type_id, true)
  	change_column_null(:sales, :delivery_type_id, true)
  end
end
