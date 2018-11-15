class Metric < ActiveRecord::Base
  belongs_to :metric_type

  default_scope -> { order("amount DESC") }
end
