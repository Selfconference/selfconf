class VenuesController < ApplicationController
  def index
    venues = Venue.all
    venues = venues.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: venues
  end

  def show
    render json: Venue.find(params[:id])
  end
end
