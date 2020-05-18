class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :street
      t.integer :str_number
      t.string :adr_unit
      t.string :adr_other
      t.integer :adr_zip
      t.string :adr_county
      t.string :adr_state
      t.string :adr_country

      t.timestamps
    end
  end
end
