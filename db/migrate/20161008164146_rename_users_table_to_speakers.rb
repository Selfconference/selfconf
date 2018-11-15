class RenameUsersTableToSpeakers < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :speakers
  end
end
