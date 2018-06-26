class SessionsController < ApplicationController

  def index
    respond_to do |format|
      format.html { @sessions = @event.sessions.includes(:room).includes(:slot).selected.uniq.with_speakers.map(&:decorate) }
      format.json do
        sessions = @event.sessions.selected
        sessions = sessions.where('updated_at > ?', params[:from_date]) if params[:from_date]
        render json: sessions.to_json(include: {speakers:
                                                  {only: [:name, :twitter, :id, :bio, :headshot]},
                                                room: {only: [:id, :name]},
                                                slot: {only: [:id, :time, :end_time]}},
                                      only: [:name, :abstract, :id, :event_id, :room_id, :slot_id])
      end
    end
  end

  def show
    session = Session.find(params[:id])
    render json: session.to_json(include: {speakers:
                                              {only: [:name, :twitter, :id, :bio, :headshot]},
                                            room: {only: [:id, :name]},
                                            slot: {only: [:id, :time, :end_time]}},
                                  only: [:name, :abstract, :id, :event_id, :room_id, :slot_id])
  end
end
