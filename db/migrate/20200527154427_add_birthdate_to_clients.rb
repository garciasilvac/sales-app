class AddBirthdateToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :birthdate, :date
  end
end
