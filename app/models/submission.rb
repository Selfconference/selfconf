class Submission < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  validates :talkname, presence: true
  validates :abstract, presence: true
  validates :talktype, presence: true
end
