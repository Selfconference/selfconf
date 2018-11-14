class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.belongs_to :event
      t.datetime :time, null: false

      t.timestamps
    end

    add_reference :sessions, :slot, index: true
    add_foreign_key :sessions, :slots
  end
end
