class CreateEventsOrganizersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :events_organizers, id: false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :organizer, index: true
    end
  end
end
