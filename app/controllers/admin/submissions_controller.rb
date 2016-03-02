class Admin::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def index
    @submissions = Submission.includes(:votes).where(event_id: @event)
  end

  def make_session
    @submission = Submission.find(params[:id])
    speaker = speaker(@submission.user)
    speaker.sessions.build(session_from(@submission))
    if speaker.save
      flash[:success] = "Submission promoted to session."
    else
      flash[:error] = "Could not promote submission."
    end
    redirect_to admin_submissions_path
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
