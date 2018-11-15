class CreateFeedback < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.belongs_to :session
      t.integer :vote
      t.text :comments
      t.timestamps
    end
  end
end
