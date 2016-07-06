class Admin::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def index
    @submissions = Submission.includes(:votes).where(event_id: @event)
  end

  def make_session
    @submissions = Submission.where(id: params[:ids])
    @submissions.each do |submission|
      submission.update_attributes(selected: true)
    end
    redirect_to root_path
  end

end
