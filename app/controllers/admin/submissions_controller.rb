class Admin::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

end
