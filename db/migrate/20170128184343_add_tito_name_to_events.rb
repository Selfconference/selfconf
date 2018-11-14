class AddTitoNameToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :tito_name, :string
  end
end
