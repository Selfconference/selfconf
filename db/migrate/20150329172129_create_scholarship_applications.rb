class CreateScholarshipApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :scholarship_applications do |t|
      t.belongs_to :event
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :location
      t.string :groups
      t.boolean :needs_help_with_tickets
      t.boolean :needs_help_with_travel
      t.boolean :needs_help_with_other
      t.text :financial_need_explanation
      t.text :why_attend
      t.text :special_accomodations

      t.timestamps
    end
  end
end
