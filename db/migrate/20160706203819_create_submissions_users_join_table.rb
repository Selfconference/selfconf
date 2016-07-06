class CreateSubmissionsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :submissions_users, id: false do |t|
      t.belongs_to :submission, index: true
      t.belongs_to :user, index: true
    end
  end
end
