class AddBirthdateToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :birthdate, :date
    Client.update_all(birthdate: Time.now.utc.to_date)
  end
end
