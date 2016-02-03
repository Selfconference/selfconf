class Admin::SubmissionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize :admin_submissions, :index?
  end

end
