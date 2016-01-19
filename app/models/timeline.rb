class Timeline < ActiveRecord::Base
  belongs_to :event
  default_scope { order(:when) }
end
