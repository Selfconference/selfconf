class RoomsController < ApplicationController

  def index
    rooms = @event.rooms
    rooms = rooms.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: rooms.to_json(only: [:id, :name])
  end

  def show
    render json: Room.find(params[:id]).to_json(only: [:id, :name])
  end
end
