class EventsController < ApplicationController

  def latest
    render json: Event.latest
  end

  def index
    render json: Event.order('start_date DESC')
  end

  def show
    render json: Event.find(params[:id])
  end

end
