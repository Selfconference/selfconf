class Selection::VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    user_id = current_user.id
    submission_id = params[:submission_id]

    vote = Vote.find_or_create_by(user_id: user_id, submission_id: submission_id)
    vote.update_attributes!(value: params[:vote])
    render json: Submission.find(submission_id).to_json(include: :votes)
  end

  def destroy
    vote = Vote.find(params[:id])
    submission_id = vote.submission_id
    vote.destroy
    render json: Submission.find(submission_id).to_json(include: :votes)
  end
end
