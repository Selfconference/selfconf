class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper


  def event
    @event = if id = params[:id]
      Event.find(params[:id])
    else
      Event.latest
    end
  end
end
