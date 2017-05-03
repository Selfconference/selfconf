class VenuesController < ApplicationController
  def index
    venues = Venue.all
    venues = venues.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: venues.to_json(only: [:id, :name, :address, :about])
  end

  def show
    render json: Venue.find(params[:id]).to_json(only: [:id, :name, :address, :about])
  end
end
