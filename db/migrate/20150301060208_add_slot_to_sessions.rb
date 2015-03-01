class AddSlotToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :slot, :datetime
  end
end
