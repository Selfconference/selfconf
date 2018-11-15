class SessionDecorator < Draper::Decorator
  delegate_all

  def speaker_names
    speakers.map(&:name).join(", ")
  end

  def twitter_handles
    speakers.pluck(:twitter).reject(&:blank?).map { |twitter|
      "<a href=\"http://twitter.com/#{twitter}\">@#{twitter}</a>"
    }.join(", ")
  end

  def slot
    "#{object.slot.time.strftime("%A")}, #{object.slot.time.in_time_zone("EST").strftime("%l:%M %p")}"
  end

  def nav_speaker_display
    {
      id: speakers.first.id,
      name: speaker_names,
    }
  end

  def name
    "#{if keynote then "Keynote - " end}#{object.name}"
  end
end
