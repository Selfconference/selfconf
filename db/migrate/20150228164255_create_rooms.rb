class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.belongs_to :event
      t.belongs_to :venue

      t.timestamps
    end
  end
end
