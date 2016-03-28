class SponsorsController < ApplicationController

  def index
    @sponsors = build_sponsors_list
    respond_to do |format|
      format.json
    end
  end

  def show
    render json: Sponsor.find(params[:id]).to_json(:include => [:sponsor_levels])
  end

  private

  def build_sponsors_list
    @event.sponsors.includes(:sponsor_levels).tap do |sponsors|
      sponsors.where('updated_at > ?', params[:from_date]) if params[:from_date]
    end
  end
end
