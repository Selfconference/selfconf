class Session < ActiveRecord::Base
  belongs_to :event
  belongs_to :room
  has_and_belongs_to_many :speakers

  default_scope -> { order("#{table_name}.name ASC") }
end
