class SponsorLevelsController < ApplicationController
  def index
    sponsor_levels = Event.find(params[:id]).sponsor_levels
    sponsor_levels = sponsor_levels.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: sponsor_levels
  end

  def show
    render json: SponsorLevel.find(params[:id]).to_json(:include => [:sponsors])
  end
end
