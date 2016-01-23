class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :organizers
  has_many :rooms
  has_many :sessions
  has_many :submissions
  has_many :speakers
  has_many :timelines
  has_many :sponsor_levels
  has_many :sponsors
  has_and_belongs_to_many :organizers
  has_one :funding_meter

  scope :latest, -> { order('start_date DESC').first }

  def submissions_open?
    return false if submissions_start.nil? or submissions_end.nil?
    Time.now > submissions_start && Time.now < submissions_end
  end
end
