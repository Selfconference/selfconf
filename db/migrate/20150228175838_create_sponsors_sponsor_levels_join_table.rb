class CreateSponsorsSponsorLevelsJoinTable < ActiveRecord::Migration
  def change
    create_table :sponsors_sponsor_levels, id: false do |t|
      t.belongs_to :sponsors, index: true
      t.belongs_to :sponsor_levels, index: true
    end
  end
end
