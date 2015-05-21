class SponsorsController < ApplicationController
  def index
    sponsors = Event.find(params[:id]).sponsors
    sponsors = sponsors.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: sponsors.to_json(:include => [:sponsor_levels])
  end

  def show
    render json: Sponsor.find(params[:id]).to_json(:include => [:sponsor_levels])
  end
end