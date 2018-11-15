class ChangeTalknameToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :submissions, :talkname, :name
  end
end
