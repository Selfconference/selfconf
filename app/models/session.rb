class Session < ActiveRecord::Base
  belongs_to :event
  belongs_to :room
  belongs_to :slot
  has_many :feedbacks
  has_and_belongs_to_many :speakers

  default_scope -> { order(keynote: :desc, name: :asc) }
  scope :with_speakers, -> { joins(:speakers) }
end
