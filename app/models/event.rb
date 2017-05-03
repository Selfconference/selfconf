class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :rooms
  has_many :slots
  has_many :sessions, dependent: :destroy
  has_many :scholarship_applications, dependent: :destroy
  has_many :timelines, dependent: :destroy
  has_many :sponsor_levels, dependent: :destroy
  has_many :sponsors, dependent: :destroy
  has_and_belongs_to_many :organizers
  has_one :funding_meter, dependent: :destroy
  has_many :metrics, dependent: :destroy
  accepts_nested_attributes_for :sponsors, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :slots, reject_if: :all_blank, allow_destroy: true

  default_scope -> { order('start_date DESC') }
  scope :latest, -> { order('start_date DESC').first }

  def submissions_open?
    return false if submissions_start.nil? or submissions_end.nil?
    Time.now > submissions_start && Time.now < submissions_end
  end

  def scholarships_open?
    return false if scholarships_start.nil? or scholarships_end.nil?
    Time.now > scholarships_start && Time.now < scholarships_end
  end

  def speakers
    sessions.map(&:speakers).flatten.uniq
  end
end
