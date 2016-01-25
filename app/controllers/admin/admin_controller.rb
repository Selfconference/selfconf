class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  before_action :latest_event

  def show
    authorize :admin_submissions, :show?
  end

  private

  def latest_event
    @event = Event.latest
  end

end
