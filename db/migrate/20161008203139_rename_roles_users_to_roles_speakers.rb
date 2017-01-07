class RenameRolesUsersToRolesSpeakers < ActiveRecord::Migration
  def change
    rename_table :roles_users, :roles_speakers

    rename_column :roles_speakers, :user_id, :speaker_id
  end
end
