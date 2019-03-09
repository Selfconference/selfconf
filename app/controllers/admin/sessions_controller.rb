class Admin::SessionsController < ApplicationController
  before_action :authenticate_speaker!
  before_action :authorize_admin!
  before_action :sessions

  def export
    send_data @sessions.to_csv, filename: "speakers-#{Date.today}.csv"
  end

  def promote_session
    @sessions.each do |session|
      session.update_attributes(selected: false)
    end
    sessions_to_promote = @sessions.where(id: params[:ids])
    sessions_to_promote.each do |session|
      session.update_attributes(selected: true)
    end
    flash[:success] = "Session Selections Updated"
    head :accepted
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

  private

  def sessions
    @sessions ||= Session.includes(:speakers).includes(:votes).where(event_id: @event)
  end
end
