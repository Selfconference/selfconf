class Admin::SessionsController < ApplicationController
  before_action :authenticate_speaker!
  before_action :authorize_admin!

  def index
    @sessions = Session.includes(:speakers).where(event_id: @event)
  end

  def make_session
    @sessions = Session.where(id: params[:ids])
    @sessions.each do |session|
      session.update_attributes(selected: true)
    end
    redirect_to root_path
  end

  def make_schedule
    @schedule = @event.slots.includes(sessions: [:room, :speakers]).where(sessions: {selected: true}).group_by {|s| s.time.to_date}
    @sessions = @event.sessions.includes(:speakers).selected.where("slot_id IS NULL").decorate
    @rooms = @event.rooms
  end

  def schedule
    session = Session.find(params[:id])
    session.update_attributes(room_id: params[:room], slot_id: params[:slot])
    head :accepted
  end
end
