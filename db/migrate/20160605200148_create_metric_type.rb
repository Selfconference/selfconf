class CreateMetricType < ActiveRecord::Migration[5.2]
  class MigrationMetricType < ActiveRecord::Base
    self.table_name = :metric_types
  end

  def change
    create_table :metric_types do |t|
      t.string :name, null: false

      t.timestamps
    end

    MigrationMetricType.create(name: "Expense")
    MigrationMetricType.create(name: "Revenue")
    MigrationMetricType.create(name: "Attendee")
    MigrationMetricType.create(name: "Speaker")
  end
end
