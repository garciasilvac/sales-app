class AddCostClassToCost < ActiveRecord::Migration[6.0]
  def change
    add_reference :costs, :cost_class, null: false, foreign_key: true
    CostClass.create! deleted:false, name:"Costs", parent:nil
  end
end
