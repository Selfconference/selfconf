class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :rooms
  has_many :sessions, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :speakers, dependent: :destroy
  has_many :timelines, dependent: :destroy
  has_many :sponsor_levels, dependent: :destroy
  has_many :sponsors, dependent: :destroy
  has_and_belongs_to_many :organizers
  has_one :funding_meter, dependent: :destroy

  scope :latest, -> { order('start_date DESC').first }

  def submissions_open?
    return false if submissions_start.nil? or submissions_end.nil?
    Time.now > submissions_start && Time.now < submissions_end
  end
end
