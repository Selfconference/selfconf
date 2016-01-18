class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :event

  def index
    @submissions = Submission.where(user_id: current_user, event_id: @event)
  end

  def new
    @submission = @event.submissions.build(user: current_user)
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def create
    @submission = @event.submissions.build(submission_params.merge(user: current_user))
    if @submission.save
      flash[:success] = "Talk submitted!"
      redirect_to event_submissions_path(@event)
    else
      render 'new'
    end
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update_attributes(submission_params)
      flash[:success] = "Submission updated!"
      redirect_to event_submissions_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    submission = Submission.find(params[:id])
    if submission.destroy
      flash[:success] = "Submission destroyed."
    else
      flash[:danger] = "Submission could not be destroyed, please try again."
    end
    redirect_to event_submissions_path(@event)
  end

  def submission_params
    params.require(:submission).permit(:talkname, :abstract, :talktype, :notes)
  end
end
