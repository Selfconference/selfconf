class OrganizersController < ApplicationController

  def index
    organizers = @event.organizers
    organizers = organizers.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: organizers.to_json(only: [:id, :name, :bio, :email, :twitter, :photo])
  end

  def show
    render json: Organizer.find(params[:id]).to_json(only: [:id, :name, :bio, :email, :twitter, :photo])
  end
end
