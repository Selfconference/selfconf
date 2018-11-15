class Admin::ScholarshipApplicationsController < ApplicationController
  before_action :authenticate_speaker!
  before_action :authorize_admin!

  def index
    @applications = @event.scholarship_applications.decorate
  end
end
