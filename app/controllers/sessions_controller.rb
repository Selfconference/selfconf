class SessionsController < ApplicationController

  def index
    respond_to do |format|
      format.html { @sessions = @event.sessions.selected.uniq.with_speakers.map(&:decorate) }
      format.json do
        sessions = @event.sessions.selected
        sessions = sessions.where('updated_at > ?', params[:from_date]) if params[:from_date]
        render json: sessions.to_json(:include => [:users, :room, :slot])
      end
    end
  end

  def show
    session = Submission.find(params[:id])
    render json: JSON.parse(session.to_json).merge(
      speakers: session.speakers.decorate,
      room: session.room
    ).to_json
  end
end
