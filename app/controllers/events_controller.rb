class EventsController < ApplicationController

  ALLOWED_IN_JSON = {include: {
                      organizers: { only: [:id, :name, :bio, :email, :twitter, :photo] },
                      venue: {only: [:id, :name, :address, :about]}
                    },
                    only: [:id, :name, :about, :twitter, :lanyard, :start_date, :end_date]}
  def latest
    render json: Event.latest.to_json(ALLOWED_IN_JSON)
  end

  def index
    events = Event.order('start_date DESC')
    events = events.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: events.to_json(ALLOWED_IN_JSON)
  end

  def show
    respond_to do |format|
      format.html { }
      format.json { render json: @event.to_json(ALLOWED_IN_JSON) }
    end
  end

  def schedule
    @schedule = @event.slots.includes(sessions: [:room, :speakers]).group_by {|s| s.time.to_date}
  end
end
