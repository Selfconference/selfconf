class Selection::SessionsController < ApplicationController
  before_filter :authenticate_speaker!
  before_action :authorize_selector!

  def index
    @sessions = Session.not_voted_on_by(current_speaker, @event)
  end

end
