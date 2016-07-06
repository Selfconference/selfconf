class ChangeTalknameToName < ActiveRecord::Migration
  def change
    rename_column :submissions, :talkname, :name
  end
end
