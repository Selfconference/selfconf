class RelateVotesToSessions < ActiveRecord::Migration[5.2]
  def change
    rename_column :votes, :submission_id, :session_id
  end
end
