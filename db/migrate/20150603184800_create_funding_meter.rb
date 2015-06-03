class CreateFundingMeter < ActiveRecord::Migration
  def change
    create_table :funding_meters do |t|
      t.belongs_to :event
      t.float :current
      t.float :goal
      t.timestamps
    end
  end
end
