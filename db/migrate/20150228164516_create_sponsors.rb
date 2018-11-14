class CreateSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :link
      t.string :photo
      t.belongs_to :event

      t.timestamps
    end
  end
end
