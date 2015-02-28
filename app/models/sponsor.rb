class Sponsor < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :sponsor_levels
end
