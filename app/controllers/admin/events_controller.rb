class Admin::EventsController < ApplicationController
  before_action :authenticate_speaker!
  before_action :authorize_admin!

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to admin_events_path
    else
      render "edit"
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
      render "new"
    end
  end

  def destroy
    @event.destroy!
    render "index"
  end

  def duplicate
    last_year = Event.latest
    this_year = Event.create(
      name: last_year.name,
      about: last_year.about,
      venue_id: last_year.venue_id,
      twitter: last_year.twitter,
      lanyard: last_year.lanyard,
      start_date: last_year.start_date + 1.year,
      end_date: last_year.end_date + 1.year)
    last_year.timelines.each do |timeline|
      this_year.timelines.create(timeline_type_id: timeline.timeline_type_id, when: timeline.when + 1.year)
    end
    last_year.slots.each do |slot|
      this_year.slots.create(time: slot.time + 1.year, end_time: slot.end_time + 1.year)
    end
    last_year.organizers.each do |organizer|
      this_year.organizers.push(organizer)
    end
    this_year.save!
    @event = this_year
    render "edit"
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
        :_destroy,
      ])
  end

  def event_params
    params.require(:event).permit(:venue_id,
      :name,
      :about,
      :venue_id,
      :twitter,
      :lanyard,
      :tito_name,
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
        sponsor_level_ids: [],
      ],
      slots_attributes: [
        :id,
        :time,
        :end_time,
        :_destroy,
      ],
      timelines_attributes: [
        :id,
        :timeline_type_id,
        :when,
        :_destroy,
      ],
      metrics_attributes: [
        :id,
        :metric_type_id,
        :name,
        :amount,
        :_destroy,
      ])
  end
end
