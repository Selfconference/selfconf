class CreateMetric < ActiveRecord::Migration[5.2]
  def change
    create_table :metrics do |t|
      t.belongs_to :event
      t.belongs_to :metric_type

      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
