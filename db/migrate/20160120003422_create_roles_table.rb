class CreateRolesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.timestamps
    end
    Role.create!(name: "admin")
    Role.create!(name: "selector")

    create_table :roles_users, index: false do |t|
      t.belongs_to :user
      t.belongs_to :role
      t.timestamps
    end
  end
end
