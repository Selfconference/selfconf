class RenameUsersTableToSpeakers < ActiveRecord::Migration
  def change
    rename_table :users, :speakers
  end
end
