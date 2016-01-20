class MigrateRoles < ActiveRecord::Migration
  def up
    adminRole = Role.find_by_name(name: "admin")
    selectorRole = Role.find_by_name(name: "selector")
    User.find_each do |user|
      if user.admin?
        user.roles << adminRole
        user.roles << selectorRole
      end
    end
  end

  def down
    role = Role.find_by_name("admin")
    User.find_each do |user|
      if user.roles.include?(role)
        user.update_attribute(:admin, true)
      end
    end
  end
end
