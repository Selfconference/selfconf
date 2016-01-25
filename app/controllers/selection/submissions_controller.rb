class Selection::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :latest_event

  def index
    authorize :selection_submissions, :index?
  end

  private

  def latest_event
    @event = Event.latest
  end

end
