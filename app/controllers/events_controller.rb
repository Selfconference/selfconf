class EventsController < ApplicationController

  def latest
    render json: Event.latest.to_json(:include => [:organizers])
  end

  def index
    events = Event.order('start_date DESC')
    events = events.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: events.to_json(:include => [:organizers])
  end

  def show
    respond_to do |format|
      format.html { }
      format.json { render json: @event.to_json(:include => [:organizers]) }
    end
  end

  def schedule
    @schedule = @event.slots.includes(sessions: [:room, :speakers]).group_by {|s| s.time.to_date}
  end
end
