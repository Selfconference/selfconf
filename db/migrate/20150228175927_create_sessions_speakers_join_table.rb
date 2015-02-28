class CreateSessionsSpeakersJoinTable < ActiveRecord::Migration
  def change
    create_table :sessions_speakers, id: false do |t|
      t.belongs_to :sessions, index: true
      t.belongs_to :speakers, index: true
    end
  end
end
