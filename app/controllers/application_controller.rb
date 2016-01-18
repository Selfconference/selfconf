class ApplicationController < ActionController::Base
  include Pundit
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def admin
    unless user_signed_in? && current_user.admin?
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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :confirm_password, :name, :bio, :headshot, :twitter) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :confirm_password, :name, :bio, :headshot, :twitter) }
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
