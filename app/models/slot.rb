class Slot < ActiveRecord::Base
  has_many :submissions
  belongs_to :event

  default_scope -> { order("#{table_name}.time ASC") }

  def time_slot
    "#{time.in_time_zone('EST').strftime('%l')} - #{slot_end}"
  end

  def slot_end
    if end_time
      end_time.in_time_zone('EST').strftime('%l:%M %p')
    else
      (time + 45.minutes).in_time_zone('EST').strftime('%l:%M %p')
    end
  end
end
