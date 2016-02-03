class Selection::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_selector!

  def index
    @submissions = Submission.not_voted_on_by(current_user, @event)
  end

end
