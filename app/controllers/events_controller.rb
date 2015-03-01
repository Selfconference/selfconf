class EventsController < ApplicationController
  def show_latest
    @event = Event.latest
  end
end
