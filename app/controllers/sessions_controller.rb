class SessionsController < ApplicationController

  def index
    respond_to do |format|
      format.html { @sessions = Session.where("event_id = #{current_event.id}").map(&:decorate) }
      format.json do
        sessions = Event.find(params[:id]).sessions
        sessions = sessions.where('updated_at > ?', params[:from_date]) if params[:from_date]
        render json: sessions.to_json(:include => [:speakers, :room])
      end
    end
  end

  def show
    render json: Session.find(params[:id]).to_json(:include => [:speakers, :room])
  end

  def schedule
    current_event = Event.find(1)
    sessions = current_event.sessions
    @schedule = {}
    sessions.map(&:slot).uniq.sort.map do |slot|
      @schedule[slot.to_date] = {} unless @schedule.has_key?(slot.to_date)
      day = @schedule[slot.to_date]
      day[slot] = {} unless day.has_key?(slot)
      sessions.map(&:room).uniq.sort.map do |room|
        day[slot][room] = nil unless day[slot].has_key?(room)
        session = current_event.sessions.where(slot: slot, room: room).first
        day[slot][room] = session.decorate if session
      end
    end
  end
end
