class CreateEventsOrganizersJoinTable < ActiveRecord::Migration
  def change
    create_table :events_organizers, id: false do |t|
      t.belongs_to :events, index: true
      t.belongs_to :organizers, index: true
    end
  end
end
