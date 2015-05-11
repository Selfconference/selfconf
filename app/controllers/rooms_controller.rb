class RoomsController < ApplicationController
  def index
    event = Event.find(params[:id])
    render json: event.rooms
  end

  def show
    render json: Room.find(params[:id])
  end
end
