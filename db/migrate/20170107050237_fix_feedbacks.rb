class FixFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :session_id
    rename_column :feedbacks, :submission_id, :session_id
  end
end
