class AddOrderToSponsorLevels < ActiveRecord::Migration
  def change
    add_column :sponsor_levels, :order, :integer
  end
end
