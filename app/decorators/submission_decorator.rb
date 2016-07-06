class SubmissionDecorator < Draper::Decorator
  delegate_all

  def speaker_names
    users.map(&:name).join(", ")
  end

  def twitter_handles
    users.pluck(:twitter).reject {|twitter| twitter.blank?}.map do |twitter|
      "<a href=\"http://twitter.com/#{twitter}\">@#{twitter}</a>"
    end.join(", ")
  end

  def slot
    "#{object.slot.time.strftime("%A")}, #{object.slot.time.in_time_zone("EST").strftime('%l:%M %p')}"
  end

  def nav_speaker_display
    {
      id: users.first.id,
      name: speaker_names
    }
  end

  def name
    "#{if keynote then "Keynote - " end}#{object.name}"
  end

end
