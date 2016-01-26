class Selection::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :latest_event

  def index
    authorize :selection_submissions, :index?
    @submissions = Submission
      .includes(:votes)
      .where(event_id: @event)
      .reject { |s|
        s.votes.map(&:user).include?(current_user)
      }
  end

  private

  def latest_event
    @event = Event.latest
  end

end
