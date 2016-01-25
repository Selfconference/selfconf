class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :latest_event

  def index
    authorize :admin_submissions, :index?
  end

  def make_selector
    authorize :admin_submissions, :admin?

    user = User.find(params[:id])
    role = Role.find_by(name: 'selector')
    user.roles << role
    redirect_to admin_users_path
  end

  def make_admin
    authorize :admin_submissions, :admin?

    user = User.find(params[:id])
    role = Role.find_by(name: 'admin')
    user.roles << role
    redirect_to admin_users_path
  end

  private

  def latest_event
    @event = Event.latest
  end

end
