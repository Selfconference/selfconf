class SpeakerDecorator < Draper::Decorator
  delegate_all

  def photo
    "https://s3.amazonaws.com/selfconf/speakers/#{name.downcase.parameterize}.jpg"
  end

end
