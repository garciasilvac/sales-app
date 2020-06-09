class AddAdressableToAdress < ActiveRecord::Migration[6.0]
  def up
    add_reference :adresses, :adressable, polymorphic: true
    Adress.all.each do |a|
      a.adressable_id = a.client_id
      a.adressable_type = "Client"
      a.save
    end
    remove_column :adresses, :client_id
  end
  def down
    add_reference :adresses, :client
    add_foreign_key :adresses, :clients
     Adress.all.each do |a|
      a.client_id = a.adressable_id
      a.save
    end
    remove_column :adresses, :adressable_id
    remove_column :adresses, :adressable_type

  end
end
