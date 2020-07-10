class AddColumnsToCost < ActiveRecord::Migration[6.0]
  def change
    add_column :costs, :cost_datetime, :datetime
    add_column :costs, :paid, :boolean
  end
end
