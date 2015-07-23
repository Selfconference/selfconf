class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :organizers
  has_many :rooms
  has_many :sessions
  has_many :speakers
  has_many :sponsor_levels
  has_many :sponsors
  has_and_belongs_to_many :organizers
  has_one :funding_meter

  scope :latest, -> { order('start_date DESC').first }

  def highlighted_speakers
    speakers.all.sample(8)
  end
end
