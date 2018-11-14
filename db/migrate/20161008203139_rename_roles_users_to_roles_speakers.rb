class RenameRolesUsersToRolesSpeakers < ActiveRecord::Migration[5.2]
  def change
    rename_table :roles_users, :roles_speakers

    rename_column :roles_speakers, :user_id, :speaker_id
  end
end
