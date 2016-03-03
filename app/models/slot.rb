class Slot < ActiveRecord::Base
  has_many :sessions
  belongs_to :event

  default_scope -> { order("#{table_name}.time ASC") }

  def time_slot
    "#{time.in_time_zone('EST').strftime('%l')} - #{(time + 45.minutes).in_time_zone('EST').strftime('%l:%M %p')}"
  end
end
