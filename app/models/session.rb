class Session < ActiveRecord::Base
  belongs_to :event
  belongs_to :room
  has_and_belongs_to_many :speakers
  has_many :feedbacks

  default_scope -> { order("#{table_name}.keynote ASC, #{table_name}.name ASC") }
end
