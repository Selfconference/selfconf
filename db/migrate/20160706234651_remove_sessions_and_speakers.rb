class RemoveSessionsAndSpeakers < ActiveRecord::Migration[5.2]
  def change
    drop_table :speakers
    drop_table :sessions
  end
end
