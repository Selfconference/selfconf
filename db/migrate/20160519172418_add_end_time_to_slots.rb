class AddEndTimeToSlots < ActiveRecord::Migration
  def change
    add_column :slots, :end_time, :timestamp
  end
end
