class AddFieldsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :url, :string
    add_column :events, :ga_tracking_id, :string
  end
end
