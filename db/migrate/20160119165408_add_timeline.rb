class AddTimeline < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.datetime :when
      t.string :what
      t.belongs_to :event, index: true
    end
  end
end
