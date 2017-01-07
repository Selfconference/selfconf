class RelateVotesToSpeakers < ActiveRecord::Migration
  def change
    rename_column :votes, :user_id, :speaker_id
  end
end
