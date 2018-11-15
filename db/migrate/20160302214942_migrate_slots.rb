class MigrateSlots < ActiveRecord::Migration[5.2]
  class MigrationSlot < ActiveRecord::Base
    self.table_name = :slots

    belongs_to :event
  end

  class MigrationSession < ActiveRecord::Base
    self.table_name = :sessions

    belongs_to :slot, class_name: "MigrationSlot"
    belongs_to :event
  end

  def up
    MigrationSession.where("slot IS NOT null").each do |s|
      slot = MigrationSlot.where(time: s[:slot], event: s.event).first_or_create!
      s.slot = slot
      s.save
    end

    remove_column :sessions, :slot, :datetime
  end

  def down
    add_column :sessions, :slot, :datetime

    MigrationSession.where("slot_id IS NOT null").each do |s|
      s.update_attributes slot: s.slot.time
      s.save
    end
  end
end
