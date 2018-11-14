class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :venue
      t.string :name
      t.text :about
      t.string :twitter
      t.string :lanyard
      t.string :tickets_link
      t.string :tickets_iframe_link
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
