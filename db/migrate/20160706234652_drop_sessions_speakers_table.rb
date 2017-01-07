class DropSessionsSpeakersTable < ActiveRecord::Migration
  def change
    drop_table :sessions_speakers
  end
end
