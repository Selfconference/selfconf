class CreateTimelineTypes < ActiveRecord::Migration[5.2]
  def up
    create_table :timeline_types do |t|
      t.string :name, null: false

      t.timestamps
    end

    TimelineType.create!(name: "Earlybird tickets go on sale")
    TimelineType.create!(name: "Call for speakers opens")
    TimelineType.create!(name: "Call for speakers closes")
    TimelineType.create!(name: "Scholarship applications open")
    TimelineType.create!(name: "Speakers announced!")
    TimelineType.create!(name: "Earlybird sales end, Regular tickets go on sale")
    TimelineType.create!(name: "Scholarship applications close")
    TimelineType.create!(name: "Scholarship winners notified")
    TimelineType.create!(name: "Regular sales end, Latecomer tickets go on sale")
    TimelineType.create!(name: "Self.conference!")

    add_column :timelines, :timeline_type_id, :integer

    Timeline.where(what: "Scholarship recipients notified").update_all(what: "Scholarship winners notified")

    TimelineType.find_each do |type|
      Timeline.where(what: type.name).update_all(timeline_type_id: type.id)
    end

    change_column :timelines, :timeline_type_id, :integer, null: false
    remove_column :timelines, :what
  end

  def down
    add_column :timelines, :what, :string

    Timeline.find_each do |timeline|
      timeline.update(what: timeline.timeline_type.name)
    end

    change_column :timelines, :what, :string, null: false
    remove_column :timelines, :timeline_type_id

    drop_table :timeline_types
  end
end
