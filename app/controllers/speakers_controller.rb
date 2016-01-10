class SpeakersController < ApplicationController
  before_action :event

  def index
    speakers = @event.speakers.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: speakers.to_json(:include => [:sessions])
  end

  def show
    render json: Speaker.find(params[:id]).to_json(:include => [:sessions])
  end
end
