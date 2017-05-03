class SlotsController < ApplicationController

  def index
    slots = @event.slots
    slots = slots.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: slots.to_json(only: [:id, :time, :end_time, :event_id])
  end

  def show
    render json: Slot.find(params[:id]).to_json(only: [:id, :time, :end_time, :event_id])
  end
end
