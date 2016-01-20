class Admin::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :latest_event

  private

  def latest_event
    @event = Event.latest
  end

end
