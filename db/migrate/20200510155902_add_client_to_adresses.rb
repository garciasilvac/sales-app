class AddClientToAdresses < ActiveRecord::Migration[6.0]
  def change
  	add_reference :adresses, :client
  end
end
