class Selection::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :latest_event

  def index
    authorize :selection_submissions, :index?
    @submissions = Submission.not_voted_on_by(current_user, @event)
  end

  private

  def latest_event
    @event = Event.latest
  end

end
