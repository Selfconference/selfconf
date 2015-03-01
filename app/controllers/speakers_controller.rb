class SpeakersController < ApplicationController

  def index
    @event = Event.latest
    @speakers = Speaker.where("event_id = #{@event.id}")
  end

end
