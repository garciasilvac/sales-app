class CreateCostClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :cost_classes do |t|
      t.boolean :deleted
      t.string :name
      t.references :parent

      t.timestamps
    end
  end
end
