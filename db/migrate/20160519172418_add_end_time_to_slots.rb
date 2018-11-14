class AddEndTimeToSlots < ActiveRecord::Migration[5.2]
  def change
    add_column :slots, :end_time, :timestamp
  end
end
