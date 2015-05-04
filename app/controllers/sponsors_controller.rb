class SponsorsController < ApplicationController
  def index
    event = Event.find(params[:id])
    render json: event.sponsors
  end

  def show
    render json: Sponsor.find(params[:id]).to_json(:include => [:sponsor_levels])
  end
end
