class CreateSponsorsSponsorLevelsJoinTable < ActiveRecord::Migration
  def change
    create_table :sponsor_levels_sponsors, id: false do |t|
      t.belongs_to :sponsor, index: true
      t.belongs_to :sponsor_level, index: true
    end
  end
end
