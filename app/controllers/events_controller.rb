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
    render json: Event.find(params[:id]).to_json(:include => [:organizers])
  end

end
