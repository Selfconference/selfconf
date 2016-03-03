class AddOrderToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :order, :integer
  end
end
