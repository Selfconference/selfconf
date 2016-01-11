class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  include UserSessionsHelper

  def logged_in
    unless logged_in?
      redirect_to login_path
    end
  end

  def admin
    unless logged_in? && current_user.admin?
      redirect_to root_url
    end
  end

  def event
    @event = if event_id
      Event.find(event_id)
    else
      Event.latest
    end
  end

  def event_id
    if params[:event_id]
      params[:event_id]
    else
      params[:id]
    end
  end
end
