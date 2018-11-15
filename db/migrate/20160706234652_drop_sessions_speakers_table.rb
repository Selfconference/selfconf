class DropSessionsSpeakersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :sessions_speakers
  end
end
