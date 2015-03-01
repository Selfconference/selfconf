class CocController < ApplicationController
  def view
    @event = Event.latest
  end
end
