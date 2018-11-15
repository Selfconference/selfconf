class RenameSubmissionsUsersToSessionsSpeakers < ActiveRecord::Migration[5.2]
  def change
    rename_table :submissions_users, :sessions_speakers

    rename_column :sessions_speakers, :submission_id, :session_id
    rename_column :sessions_speakers, :user_id, :speaker_id
  end
end
