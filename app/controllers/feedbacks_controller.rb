class FeedbacksController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    session = Session.find(params[:id])
    if session.present? && feedback = session.feedbacks.create!(feedback_params)
      render json: feedback
    else
      render json: { errors: feedback.errors.full_messages }, status: 500
    end

  end

  def feedback_params
    params.require(:feedback).permit(:vote, :comments)
  end
end
