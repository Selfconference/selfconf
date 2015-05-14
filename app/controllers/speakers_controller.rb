class SpeakersController < ApplicationController
  def index
    event = Event.find(params[:id])
    render json: event.speakers.to_json(:include => [:sessions])
  end

  def show
    render json: Speaker.find(params[:id]).to_json(:include => [:sessions])
  end
end
