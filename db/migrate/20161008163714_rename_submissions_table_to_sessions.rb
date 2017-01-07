class RenameSubmissionsTableToSessions < ActiveRecord::Migration
  def change
    rename_table :submissions, :sessions
  end
end
