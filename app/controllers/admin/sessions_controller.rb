class Admin::SessionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def index
    @schedule = @event.slots.includes(submissions: [:room, :users]).where(submissions: {selected: true}).group_by {|s| s.time.to_date}
    @sessions = @event.submissions.selected.where('slot_id IS NULL').decorate
    @rooms = @event.rooms
  end

  def schedule
    session = Session.find(params[:id])
    session.update_attributes(room_id: params[:room], slot_id: params[:slot])
    head :accepted
  end

end
