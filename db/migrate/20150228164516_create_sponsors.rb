class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :link
      t.string :photo
      t.belongs_to :event_id

      t.timestamps
    end
  end
end
