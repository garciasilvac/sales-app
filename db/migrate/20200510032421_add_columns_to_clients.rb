class AddColumnsToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :middle_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :phone_countrycode, :integer
    add_column :clients, :phone_number, :integer
    add_column :clients, :email, :string
    add_column :clients, :age, :integer
    add_column :clients, :sex, :string
  end
end
