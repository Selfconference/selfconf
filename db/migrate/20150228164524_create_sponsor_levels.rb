class CreateSponsorLevels < ActiveRecord::Migration
  def change
    create_table :sponsor_levels do |t|
      t.string :name
      t.belongs_to :event_id

      t.timestamps
    end
  end
end
