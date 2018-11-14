class AddScholarshipDatesToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :scholarships_start, :datetime
    add_column :events, :scholarships_end, :datetime
    add_column :events, :scholarships_announce, :datetime
  end
end
