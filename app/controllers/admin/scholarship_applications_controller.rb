class Admin::ScholarshipApplicationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def index
    @applications = @event.scholarship_applications.decorate
  end

end
