class Selection::SubmissionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize :selection_submissions, :index?
    @submissions = Submission.not_voted_on_by(current_user, @event)
  end

end
