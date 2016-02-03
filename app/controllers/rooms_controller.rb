class RoomsController < ApplicationController

  def index
    rooms = @event.rooms
    rooms = rooms.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: rooms
  end

  def show
    render json: Room.find(params[:id])
  end
end
