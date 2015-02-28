class Event < ActiveRecord::Base
  has_one :venue
  has_many :organizers
  has_many :rooms
  has_many :sessions
  has_many :speakers
  has_many :sponsor_levels
  has_many :sponsors
  has_and_belongs_to_many :organizers
end
