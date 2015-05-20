class OrganizersController < ApplicationController
  def index
    organizers = Event.find(params[:id]).organizers
    organizers = organizers.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: organizers
  end

  def show
    render json: Organizer.find(params[:id])
  end
end
