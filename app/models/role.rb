class Role < ActiveRecord::Base
  has_and_belongs_to_many :speakers

  def self.admin
    @admin ||= Role.find_by_name("admin")
  end

  def self.selector
    @selector ||= Role.find_by_name("selector")
  end
end
