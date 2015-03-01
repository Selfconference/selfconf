class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :name
      t.text :bio
      t.string :email
      t.string :twitter
      t.string :photo

      t.timestamps
    end
  end
end
