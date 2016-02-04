class Admin::EventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to admin_events_path
    else
      render 'edit'
    end
  end

  def new
    @event = Event.build
  end

  def create
    @event = Event.build(event_params)
    if @event.save
      flash[:success] = "Event created"
      redirect_to admin_events_path
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:venue_id,
                                  :name,
                                  :about,
                                  :twitter,
                                  :lanyard,
                                  :tickets_link,
                                  :tickets_iframe_link,
                                  :start_date,
                                  :end_date,
                                  :extra,
                                  :sessions_published,
                                  :submissions_start,
                                  :submissions_end)
  end

end
