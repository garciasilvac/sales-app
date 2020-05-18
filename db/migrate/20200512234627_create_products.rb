class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :subtype, null: false, foreign_key: true
      t.integer :price
      t.boolean :deleted

      t.timestamps
    end
  end
end
