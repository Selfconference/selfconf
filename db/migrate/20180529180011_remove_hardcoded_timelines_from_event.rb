class RemoveHardcodedTimelinesFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column(:events, :sessions_published, :boolean)
    remove_column(:events, :submissions_start, :datetime)
    remove_column(:events, :submissions_end, :datetime)
    remove_column(:events, :scholarships_start, :datetime)
    remove_column(:events, :scholarships_end, :datetime)
    remove_column(:events, :scholarships_announce, :datetime)
  end
end
