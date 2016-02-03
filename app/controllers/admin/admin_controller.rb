class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!

  def show
    authorize :admin_submissions, :show?
  end

end
