class ScholarshipApplication < ActiveRecord::Base
  belongs_to :event

  validates :first_name, :last_name, :email, :location, :groups, :why_attend, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
