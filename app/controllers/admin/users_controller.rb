class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def make_selector
    user = User.find(params[:id])
    role = Role.find_by(name: 'selector')
    user.roles << role
    redirect_to admin_users_path
  end

  def make_admin
    user = User.find(params[:id])
    role = Role.find_by(name: 'admin')
    user.roles << role
    redirect_to admin_users_path
  end

end
