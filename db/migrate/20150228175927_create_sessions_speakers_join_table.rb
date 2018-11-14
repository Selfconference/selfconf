class CreateSessionsSpeakersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions_speakers, id: false do |t|
      t.belongs_to :session, index: true
      t.belongs_to :speaker, index: true
    end
  end
end
