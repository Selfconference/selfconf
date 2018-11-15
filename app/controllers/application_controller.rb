class ApplicationController < ActionController::Base
  include Pundit
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :event
  around_action :set_time_zone

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :confirm_password, :name, :bio, :headshot, :twitter) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :confirm_password, :name, :bio, :headshot, :twitter) }
  end

  private

  def authorize_admin!
    authorize(:admin, :admin?)
  end

  def authorize_selector!
    authorize(:selector, :selector?)
  end

  def event
    @event = if params[:event_id]
      Event.find(params[:event_id])
    elsif request.path.include?("events") && params.key?(:id) && is_number?(params[:id])
      Event.find(params[:id])
    else
      Event.latest
    end
  end

  def is_number?(id)
    true if Integer(id)
  rescue
    false
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def set_time_zone(&block)
    Time.use_zone("EST", &block)
  end

  def pundit_user
    current_speaker
  end
end
