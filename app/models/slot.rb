class Slot < ActiveRecord::Base
  has_many :sessions
  belongs_to :event

  default_scope -> { order("#{table_name}.time ASC") }

  def time_slot
    if slot.time.beginning_of_hour == slot.time
      "#{time.in_time_zone('EST').strftime('%l')} - #{slot_end}"
    else
      "#{time.in_time_zone('EST').strftime('%l:%M')} - #{slot_end}"
    end
  end

  def slot_end
    if end_time
      end_time.in_time_zone('EST').strftime('%l:%M %p')
    else
      (time + 45.minutes).in_time_zone('EST').strftime('%l:%M %p')
    end
  end
end
