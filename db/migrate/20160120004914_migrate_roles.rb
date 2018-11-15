class MigrateRoles < ActiveRecord::Migration[5.2]
  class MigrationUser < ActiveRecord::Base
    self.table_name = :users
    has_many :roles
  end

  def up
    admin_role = Role.find_by_name("admin")
    selector_role = Role.find_by_name("selector")
    MigrationUser.find_each do |user|
      if user.admin == true
        user.roles << admin_role
        user.roles << selector_role
      end
    end
  end

  def down
    role = Role.find_by_name("admin")
    MigrationUser.find_each do |user|
      if user.roles.include?(role)
        user.update_attribute(:admin, true)
      end
    end
  end
end
