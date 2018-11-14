class RemoveSpeakerFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :speaker_id, :integer
  end
end
