class RelateVotesToSpeakers < ActiveRecord::Migration[5.2]
  def change
    rename_column :votes, :user_id, :speaker_id
  end
end
