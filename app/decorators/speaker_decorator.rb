class SpeakerDecorator < Draper::Decorator
  delegate_all

  def headshot
    return object.headshot unless object.headshot.blank?
    "https://s3.amazonaws.com/selfconf/robit-#{rand(1..6)}.png"
  end

end
