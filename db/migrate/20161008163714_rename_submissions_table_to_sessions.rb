class RenameSubmissionsTableToSessions < ActiveRecord::Migration[5.2]
  def change
    rename_table :submissions, :sessions
  end
end
