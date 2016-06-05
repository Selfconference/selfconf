class UsersController < ApplicationController
  before_filter :authenticate_user!

  def talks
    @talks = User.find(params[:user_id]).speaker.sessions
  end

end
