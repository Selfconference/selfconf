class ApplicationController < ActionController::Base
  include Pundit
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :event

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :confirm_password, :name, :bio, :headshot, :twitter) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :confirm_password, :name, :bio, :headshot, :twitter) }
  end

  private

  def event
    @event = if params[:event_id]
      Event.find(params[:event_id])
    elsif request.path.start_with?("/events")
      Event.find(params[:id])
    else
      Event.latest
    end
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
