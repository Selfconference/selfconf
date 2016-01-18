class Admin::SubmissionsController < ApplicationController
  before_filter :selector
  before_action :event

  def index
    @submissions = Submission.where(event_id: @event)
  end

end
