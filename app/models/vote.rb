class Vote < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :session
end
