class SubmissionsController < ApplicationController
  before_filter :authenticate_user!, except: :index
  before_action :latest_event

  def index
    if user_signed_in?
      @submissions = Submission.where(user_id: current_user, event_id: @event)
    end
  end

  def new
    @submission = @event.submissions.build(user: current_user)
  end

  def edit
    @submission = Submission.find(params[:id])
    authorize @submission
  end

  def create
    @submission = @event.submissions.build(submission_params.merge(user: current_user))
    if @submission.save
      flash[:success] = "Talk submitted!"
      redirect_to submissions_path
    else
      render 'new'
    end
  end

  def update
    @submission = Submission.find(params[:id])
    authorize @submission
    if @submission.update_attributes(submission_params)
      flash[:success] = "Submission updated!"
      redirect_to submissions_path
    else
      render 'edit'
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    authorize @submission
    if @submission.destroy
      flash[:success] = "Submission destroyed."
    else
      flash[:danger] = "Submission could not be destroyed, please try again."
    end
    redirect_to submissions_path
  end

  def submission_params
    params.require(:submission).permit(:talkname, :abstract, :talktype, :notes)
  end

  def latest_event
    @event = Event.latest
  end
end
