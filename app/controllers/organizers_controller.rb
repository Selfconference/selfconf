class OrganizersController < ApplicationController

  def index
    organizers = @event.organizers.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: organizers
  end

  def show
    render json: Organizer.find(params[:id])
  end
end
