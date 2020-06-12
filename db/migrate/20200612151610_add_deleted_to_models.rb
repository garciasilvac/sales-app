class AddDeletedToModels < ActiveRecord::Migration[6.0]
  def change
  	add_column :adresses, :deleted, :boolean
  	add_column :clients, :deleted, :boolean
  	add_column :users, :deleted, :boolean
  end
end
