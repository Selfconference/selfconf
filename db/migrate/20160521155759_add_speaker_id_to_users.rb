class AddSpeakerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :speaker_id, :integer
  end
end
