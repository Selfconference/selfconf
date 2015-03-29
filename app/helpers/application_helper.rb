module ApplicationHelper

  def current_event
    @event ||= Event.latest
  end

end
