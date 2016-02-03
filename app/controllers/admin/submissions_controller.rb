class Admin::SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_admin!

  def make_session
    @submission = Submission.find(params[:id])
    speaker = @event.speakers.build(speaker_from(@submission.user))
    speaker.sessions.build(session_from(@submission))
    if speaker.save
      flash[:success] = "#{speaker.name} is now a speaker."
    else
      flash[:error] = "Could not promote submission."
    end
    redirect_to admin_submissions_path
  end

  private

  def speaker_from(user)
    {
      name: user.name,
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
