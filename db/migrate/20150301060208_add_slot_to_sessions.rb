class AddSlotToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :slot, :datetime
  end
end
