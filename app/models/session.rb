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
    includes(:votes).where(event_id: event).reject { |s|
      s.votes.map(&:speaker).include?(speaker)
    }
  end
end
