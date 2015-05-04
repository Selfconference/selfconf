class SponsorLevelsController < ApplicationController
  def index
    event = Event.find(params[:id])
    render json: event.sponsor_levels
  end

  def show
    render json: SponsorLevel.find(params[:id]).to_json(:include => [:sponsors])
  end
end
