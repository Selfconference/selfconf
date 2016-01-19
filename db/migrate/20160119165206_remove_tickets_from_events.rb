class RemoveTicketsFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :tickets, :text
  end
end
