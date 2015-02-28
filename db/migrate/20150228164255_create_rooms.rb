class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.belongs_to :event_id
      t.belongs_to :venue_id

      t.timestamps
    end
  end
end
