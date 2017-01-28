class AddTitoNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tito_name, :string
  end
end
