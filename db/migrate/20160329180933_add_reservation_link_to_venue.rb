class AddReservationLinkToVenue < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :reservation, :string
  end
end
