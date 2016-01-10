class EventsController < ApplicationController
  before_action :event

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

  def event
    @event = if id = params[:id]
      Event.find(params[:id])
    else
      Event.latest
    end
  end

end
