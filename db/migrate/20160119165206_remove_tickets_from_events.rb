class RemoveTicketsFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :tickets, :text
  end
end
