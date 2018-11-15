class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :name
      t.text :abstract
      t.boolean :keynote
      t.belongs_to :event
      t.belongs_to :room

      t.timestamps
    end
  end
end
