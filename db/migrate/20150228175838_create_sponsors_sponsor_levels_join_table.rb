class CreateSponsorsSponsorLevelsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsor_levels_sponsors, id: false do |t|
      t.belongs_to :sponsor, index: true
      t.belongs_to :sponsor_level, index: true
    end
  end
end
