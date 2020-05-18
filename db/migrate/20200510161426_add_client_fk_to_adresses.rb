class AddClientFkToAdresses < ActiveRecord::Migration[6.0]
  def change
  	add_foreign_key :adresses, :clients
  end
end
