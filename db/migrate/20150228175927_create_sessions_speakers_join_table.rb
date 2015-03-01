class CreateSessionsSpeakersJoinTable < ActiveRecord::Migration
  def change
    create_table :sessions_speakers, id: false do |t|
      t.belongs_to :session, index: true
      t.belongs_to :speaker, index: true
    end
  end
end
