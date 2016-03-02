class Admin::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def index
    @submissions = Submission.includes(:votes).where(event_id: @event)
  end

  def make_session
    @submissions = Submission.where(id: params[:ids])
    @submissions.each do |submission|
      speaker = speaker(submission.user)
      speaker.sessions.build(session_from(submission))
      speaker.save
    end
    redirect_to root_path
  end

  private

  def speaker(user)
    if speaker = Speaker.find_by(name: user.name, event: @event)
      speaker.update_attributes(speaker_from(user))
      speaker
    else
      @event.speakers.create!({name: user.name}.merge(speaker_from(user)))
    end
  end

  def speaker_from(user)
    {
      twitter: user.twitter,
      bio: user.bio,
      photo: user.headshot
    }
  end

  def session_from(submission)
    {
      name: submission.talkname,
      abstract: submission.abstract,
      event_id: submission.event_id,
      keynote: false
    }
  end

end
