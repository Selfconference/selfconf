class RemoveSpeakerFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :speaker_id, :integer
  end
end
