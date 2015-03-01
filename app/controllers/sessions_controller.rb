class SessionsController < ApplicationController

  def index
    @event = Event.latest
    @sessions = Session.where("event_id = #{@event.id}").map(&:decorate)
  end

end
