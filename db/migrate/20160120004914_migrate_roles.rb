class MigrateRoles < ActiveRecord::Migration
  class MigrationUser < ActiveRecord::Base
    self.table_name = :users
    has_many :roles
  end

  def up
    adminRole = Role.find_by_name("admin")
    selectorRole = Role.find_by_name("selector")
    MigrationUser.find_each do |user|
      if user.admin == true
        user.roles << adminRole
        user.roles << selectorRole
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
