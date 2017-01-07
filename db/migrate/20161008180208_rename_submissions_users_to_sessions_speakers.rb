class RenameSubmissionsUsersToSessionsSpeakers < ActiveRecord::Migration
  def change
    rename_table :submissions_users, :sessions_users

    rename_column :sessions_users, :submission_id, :session_id
    rename_column :sessions_users, :user_id, :speaker_id
  end
end
