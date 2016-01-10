class AddTicketsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tickets, :text
  end
end
