class EventsController < ApplicationController

  def latest
    render json: Event.latest.to_json(:include => [:organizers])
  end

  def index
    render json: Event.order('start_date DESC').to_json(:include => [:organizers])
  end

  def show
    render json: Event.find(params[:id]).to_json(:include => [:organizers])
  end

end
