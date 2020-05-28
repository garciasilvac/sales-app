class RemoveAgeFromClients < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :age, :integer
  end
end
