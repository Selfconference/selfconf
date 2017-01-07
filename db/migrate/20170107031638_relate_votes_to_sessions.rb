class RelateVotesToSessions < ActiveRecord::Migration
  def change
    rename_column :votes, :submission_id, :session_id
  end
end
