require "csv"

class Session < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_and_belongs_to_many :speakers
  belongs_to :event
  belongs_to :room
  belongs_to :slot
  has_many :feedbacks

  validates :name, presence: true
  validates :abstract, presence: true
  validates :talktype, presence: true

  default_scope -> { order(keynote: :desc, name: :asc) }
  scope :with_speakers, -> { joins(:speakers) }
  scope :selected, -> { where(selected: true) }
  scope :unselected, -> { where(selected: false) }

  def self.not_voted_on_by(speaker, event)
    where(event_id: event).reject { |s|
      s.votes.includes(:speaker).map(&:speaker).include?(speaker)
    }
  end

  def self.to_csv
    attributes = %w{total_votes id talktype speaker_names speaker_emails name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def total_votes
    votes.pluck(:value).reduce(:+)
  end

  def speaker_names
    speakers.map(&:name).join(", ")
  end

  def speaker_emails
    speakers.map(&:email).join(", ")
  end
end
