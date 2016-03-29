class AddReservationLinkToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :reservation, :string
  end
end
