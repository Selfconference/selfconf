class Submission < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_and_belongs_to_many :users
  belongs_to :event
  belongs_to :room
  belongs_to :slot
  has_many :feedbacks

  validates :name, presence: true
  validates :abstract, presence: true
  validates :talktype, presence: true

  default_scope -> { order(keynote: :desc, name: :asc) }
  scope :with_speakers, -> { joins(:users) }
  scope :selected, -> { where(selected: true) }
  scope :unselected, -> { where(selected: false) }

  def self.not_voted_on_by(user, event)
    includes(:votes).where(event_id: event).reject { |s|
      s.votes.map(&:user).include?(user)
    }
  end
end
