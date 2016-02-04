class Admin::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

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
    speaker = Speaker.find_or_create_by(name: user.name)
    speaker.update_attributes(speaker_from(user))
    speaker
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
      event_id: submission.event_id
    }
  end

end
