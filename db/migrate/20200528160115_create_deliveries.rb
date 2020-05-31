class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.references :sale, null: false, foreign_key: true
      t.date :sched_date
      t.integer :sched_timeblock
      t.boolean :delivered
      t.date :real_date
      t.integer :real_timeblock
      t.boolean :deleted

      t.timestamps
    end
  end
end
