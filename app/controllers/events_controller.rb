class EventsController < ApplicationController

  def latest
    render json: Event.latest.to_json(:include => [:organizers])
  end

  def index
    events = Event.order('start_date DESC')
    events = events.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: events.to_json(:include => [:organizers])
  end

  def show
    respond_to do |format|
      format.html { }
      format.json { render json: @event.to_json(:include => [:organizers]) }
    end
  end

  def schedule
    sessions = @event.sessions
    @schedule = {}
    sessions.pluck(:slot).compact.uniq.sort.map do |slot|
      @schedule[slot.to_date] = {} unless @schedule.has_key?(slot.to_date)
      day = @schedule[slot.to_date]
      day[slot] = {} unless day.has_key?(slot)
      sessions.map(&:room).compact.uniq.sort.map do |room|
        day[slot][room] = nil unless day[slot].has_key?(room)
        session = @event.sessions.where(slot: slot, room: room).first
        day[slot][room] = session.decorate if session
      end
    end
  end
end
