class SpeakersController < ApplicationController

  def index
    speakers = @event.speakers
    speakers = speakers.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: speakers.decorate.to_json(:include => [:sessions])
  end

  def show
    render json: Speaker.find(params[:id]).decorate.to_json(:include => [:sessions])
  end

end
