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
  accepts_nested_attributes_for :timelines, reject_if: :all_blank, allow_destroy: true

  default_scope -> { order("start_date DESC") }
  scope :latest, -> { order("start_date DESC").first }
  scope :last_year, -> { order("start_date DESC").second }

  def submissions_start
    timelines.find_by(timeline_type: TimelineType.find_by(name: TimelineType::SUBMISSIONS_START)).try(:when)
  end

  def submissions_end
    timelines.find_by(timeline_type: TimelineType.find_by(name: TimelineType::SUBMISSIONS_END)).try(:when)
  end

  def scholarships_start
    timelines.find_by(timeline_type: TimelineType.find_by(name: TimelineType::SCHOLARSHIPS_START)).try(:when)
  end

  def scholarships_end
    timelines.find_by(timeline_type: TimelineType.find_by(name: TimelineType::SCHOLARSHIPS_END)).try(:when)
  end

  def scholarships_announce
    timelines.find_by(timeline_type: TimelineType.find_by(name: TimelineType::SCHOLARSHIPS_ANNOUNCE)).try(:when)
  end

  def sessions_published
    timelines.find_by(timeline_type: TimelineType.find_by(name: TimelineType::SESSIONS_PUBLISHED)).try(:when)
  end

  def submissions_open?
    return false if submissions_start.nil? || submissions_end.nil?
    Time.now > submissions_start && Time.now < submissions_end
  end

  def scholarships_open?
    return false if scholarships_start.nil? || scholarships_end.nil?
    Time.now > scholarships_start && Time.now < scholarships_end
  end

  def speakers
    sessions.map(&:speakers).flatten.uniq
  end
end
