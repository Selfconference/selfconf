class KeynoteDefault < ActiveRecord::Migration[5.2]
  def up
    change_column :sessions, :keynote, :boolean, null: false, default: false
  end

  def down
    change_column :sessions, :keynote, :boolean, null: true
  end
end
