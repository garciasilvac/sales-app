class CreateCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :costs do |t|
      t.boolean :deleted
      t.string :name
      t.bigint :value
      t.string :document_id

      t.timestamps
    end
  end
end
