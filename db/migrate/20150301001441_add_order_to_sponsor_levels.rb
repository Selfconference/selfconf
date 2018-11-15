class AddOrderToSponsorLevels < ActiveRecord::Migration[5.2]
  def change
    add_column :sponsor_levels, :order, :integer
  end
end
