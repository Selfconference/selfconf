class SessionsController < ApplicationController

  def index
    @sessions = Session.where("event_id = #{current_event.id}").map(&:decorate)
  end

  def schedule
    @schedule = {}
    current_event.sessions.map(&:slot).uniq.sort.each do |slot|
      @schedule[slot.to_date] = {} unless @schedule.has_key?(slot.to_date)
      day = @schedule[slot.to_date]
      day[slot] = {} unless day.has_key?(slot)
      current_event.sessions.map(&:room).uniq.sort.each do |room|
        session = current_event.sessions.where(slot: slot, room: room).first
        day[slot][room] = session.decorate if session
      end
    end
  end
end
