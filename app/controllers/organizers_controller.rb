class OrganizersController < ApplicationController
  def index
    event = Event.find(params[:id])
    render json: event.organizers
  end

  def show
    render json: Organizer.find(params[:id])
  end
end
