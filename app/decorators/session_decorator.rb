class SessionDecorator < Draper::Decorator
  delegate_all

  def speaker_names
    speakers.map(&:name).join(", ")
  end

  def nav_speaker_display
    {
      id: speakers.first.id,
      name: speaker_names
    }
  end

  def speakers
    object.speakers.map(&:decorate)
  end

  def name
    "#{if keynote then "Keynote - " end}#{object.name}"
  end

end
