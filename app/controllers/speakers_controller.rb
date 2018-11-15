class SpeakersController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        speakers = @event.speakers
        speakers.where("updated_at > ?", params[:from_date]) if params[:from_date]
      end
      format.json do
        speakers = @event.speakers
        speakers = speakers.where("updated_at > ?", params[:from_date]) if params[:from_date]
        render json: speakers.to_json(only: [:id, :name, :bio, :headshot, :twitter, :event_id])
      end
    end
  end

  def show
    render json: Speaker.find(params[:id]).
      decorate.
      to_json(only: [:id, :name, :bio, :headshot, :twitter, :event_id])
  end
end
