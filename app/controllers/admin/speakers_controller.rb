class Admin::SpeakersController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def edit
    @speaker = Speaker.find(params[:id])
  end

  def update
    @speaker = Speaker.find(params[:id])
    if @speaker.update_attributes(speaker_params)
      flash[:success] = "Speaker updated"
      redirect_to admin_speakers_path
    else
      render 'edit'
    end
  end

  def new
    @speaker = @event.speakers.build
  end

  def create
    @speaker = @event.speakers.build(speaker_params)
    if @speaker.save
      flash[:success] = "Speaker created"
      redirect_to admin_speakers_path
    else
      render 'new'
    end
  end

  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.sessions.each do |s|
      if s.speakers.count > 1
        s.speakers.delete(@speaker)
      else
        s.destroy
      end
    end
    if @speaker.destroy
      flash[:success] = "Speaker destroyed"
    else
      flash[:error] = "Speaker could not be destroyed"
    end
    redirect_to admin_speakers_path
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

end
