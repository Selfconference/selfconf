class Speaker < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :sessions

  default_scope -> { order("#{table_name}.name ASC") }
end
