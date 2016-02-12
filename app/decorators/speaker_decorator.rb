class SpeakerDecorator < Draper::Decorator
  delegate_all

  def photo
    return object.photo unless object.photo.blank?
    "https://s3.amazonaws.com/selfconf/robit-#{rand(1..6)}.png"
  end

end
