class CreateSpeakers < ActiveRecord::Migration[5.2]
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :twitter
      t.text :bio
      t.string :photo
      t.belongs_to :event

      t.timestamps
    end
  end
end
