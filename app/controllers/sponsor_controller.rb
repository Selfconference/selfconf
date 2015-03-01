class SponsorController < ApplicationController
  def view
    @event = Event.latest
  end
end
