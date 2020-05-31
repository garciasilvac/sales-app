class AddStartAndEndTimeToTimeBlock < ActiveRecord::Migration[6.0]
  def change
  	add_column :timeblocks, :start_time, :time
  	add_column :timeblocks, :end_time, :time
  end
end
