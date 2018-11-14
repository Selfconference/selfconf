class AddSubmissionIdToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :submission_id, :integer
  end
end
