class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.text :about
      t.string :maps_link
      t.string :address
      t.belongs_to :events

      t.timestamps
    end
  end
end
