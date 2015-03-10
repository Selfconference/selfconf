class SessionsController < ApplicationController

  def index
    @event = Event.latest
    @sessions = Session.where("event_id = #{@event.id}").map(&:decorate)
  end

  def schedule
    @event = Event.latest

    @schedule = {}
    @event.sessions.map(&:slot).uniq.sort.each do |slot|
      @schedule[slot.to_date] = {} unless @schedule.has_key?(slot.to_date)
      day = @schedule[slot.to_date]
      day[slot] = {} unless day.has_key?(slot)
      @event.sessions.map(&:room).uniq.sort.each do |room|
        session = @event.sessions.where(slot: slot, room: room).first
        day[slot][room] = session.decorate if session
      end
    end
  end
end
