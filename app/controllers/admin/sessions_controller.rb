class Admin::SessionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def index
    @sessions = @event.sessions.decorate
  end

  def schedule
    session = Session.find(params[:id])
    session.update_attributes(room_id: params[:room], slot: params[:slot])
    head :accepted
  end

end
