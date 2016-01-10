class AddExtraToEvents < ActiveRecord::Migration
  def change
    add_column :events, :extra, :text
  end
end
