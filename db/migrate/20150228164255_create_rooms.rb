class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.belongs_to :event
      t.belongs_to :venue

      t.timestamps
    end
  end
end
