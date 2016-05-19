class Session < ActiveRecord::Base
  belongs_to :event
  belongs_to :room
  belongs_to :slot
  has_and_belongs_to_many :speakers
  has_many :feedbacks

  default_scope -> { order(keynote: :desc, name: :asc) }
  scope :with_speakers, -> { joins(:speakers) }
end
