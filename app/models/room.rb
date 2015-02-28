class Room < ActiveRecord::Base
  belongs_to :event
  belongs_to :venue
  has_many :sessions
end
