class Submission < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  belongs_to :event

  validates :talkname, presence: true
  validates :abstract, presence: true
  validates :talktype, presence: true

  def self.not_voted_on_by(user, event)
    includes(:votes).where(event_id: event).reject { |s|
      s.votes.map(&:user).include?(user)
    }
  end
end
