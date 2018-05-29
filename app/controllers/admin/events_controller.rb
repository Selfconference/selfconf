class Admin::EventsController < ApplicationController
  before_filter :authenticate_speaker!
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

  def speaker_params
    params.require(:speaker).permit(:name,
                                    :bio,
                                    :twitter,
                                    :photo,
                                    sessions_attributes: [
                                      :id,
                                      :event_id,
                                      :name,
                                      :keynote,
                                      :abstract,
                                      :room_id,
                                      :slot,
                                      :_destroy])
  end

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
                                  :submissions_end,
                                  :scholarships_start,
                                  :scholarships_end,
                                  :scholarships_announce,
                                  sponsors_attributes: [
                                    :id,
                                    :name,
                                    :link,
                                    :photo,
                                    :_destroy,
                                    sponsor_level_ids: []],
                                 slots_attributes: [
                                    :id,
                                    :time,
                                    :end_time,
                                    :_destroy],
                                 timelines_attributes: [
                                    :id,
                                    :timeline_type_id,
                                    :when,
                                    :_destroy])
  end

end
