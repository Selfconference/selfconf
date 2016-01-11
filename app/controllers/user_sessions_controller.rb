class UserSessionsController < ApplicationController
  before_action :event

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to event_submissions_path(@event)
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
