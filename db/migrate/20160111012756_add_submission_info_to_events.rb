class AddSubmissionInfoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :sessions_published, :boolean
    add_column :events, :submissions_start, :datetime
    add_column :events, :submissions_end, :datetime
  end
end
