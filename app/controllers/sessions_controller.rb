class SessionsController < ApplicationController

  def index
    respond_to do |format|
      format.html { @sessions = @event.sessions.with_speakers.map(&:decorate) }
      format.json do
        sessions = @event.sessions
        sessions = sessions.where('updated_at > ?', params[:from_date]) if params[:from_date]
        render json: sessions.to_json(:include => [:speakers, :room, :slot])
      end
    end
  end

  def show
    session = Session.find(params[:id])
    render json: JSON.parse(session.to_json).merge(
      speakers: session.speakers.decorate,
      room: session.room
    ).to_json
  end
end
