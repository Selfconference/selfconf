class SessionsController < ApplicationController
  before_action :event

  def index
    respond_to do |format|
      format.html { @sessions = Session.where("event_id = #{@event.id}").map(&:decorate) }
      format.json do
        sessions = @event.sessions.where('updated_at > ?', params[:from_date]) if params[:from_date]
        render json: sessions.to_json(:include => [:speakers, :room])
      end
    end
  end

  def show
    render json: Session.find(params[:id]).to_json(:include => [:speakers, :room])
  end
end
