class MigrateUserFromSubmissions < ActiveRecord::Migration[5.2]
  class MigrationSubmissionUser < ActiveRecord::Base
    self.table_name = :submissions_users
  end

  class MigrationSubmission < ActiveRecord::Base
    self.table_name = :submissions
  end

  def up
    MigrationSubmission.find_each do |sub|
      MigrationSubmissionUser.create!(user_id: sub.user_id, submission_id: sub.id)
    end

    remove_column :submissions, :user_id, :integer
  end

  def down
    add_column :submissions, :user_id, :integer

    MigrationSubmissionUser.all.each do |sub|
      MigrationSubmission.find(sub.submission_id).update_attributes(user_id: sub.user_id)
    end
  end
end
