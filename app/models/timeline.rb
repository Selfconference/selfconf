class Timeline < ActiveRecord::Base
  belongs_to :event
  belongs_to :timeline_type
  default_scope { order(:when) }
end
