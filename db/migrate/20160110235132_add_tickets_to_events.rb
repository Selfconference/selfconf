class AddTicketsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :tickets, :text
  end
end
