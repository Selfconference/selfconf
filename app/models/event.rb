class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :organizers
  has_many :rooms
  has_many :sessions
  has_many :speakers
  has_many :sponsor_levels
  has_many :sponsors
  has_and_belongs_to_many :organizers

  scope :latest, -> { order('start_date DESC').first }

  def highlighted_speakers
    speakers = []
    speakers << Speaker.find(2)
    speakers << Speaker.find(4)
    speakers << Speaker.find(1)
    speakers << Speaker.find(3)
    speakers << Speaker.find(13)
    speakers << Speaker.find(20)
    speakers << Speaker.find(35)
    speakers << Speaker.find(43)
  end
end
