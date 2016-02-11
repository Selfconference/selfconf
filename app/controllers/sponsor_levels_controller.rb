class SponsorLevelsController < ApplicationController

  def index
    sponsor_levels = @event.sponsor_levels
    sponsor_levels = sponsor_levels.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: sponsor_levels.to_json(:include => [:sponsors])
  end

  def show
    render json: SponsorLevel.find(params[:id]).to_json(:include => [:sponsors])
  end
end
