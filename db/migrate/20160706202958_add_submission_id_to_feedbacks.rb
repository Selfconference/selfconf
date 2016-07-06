class AddSubmissionIdToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :submission_id, :integer
  end
end
