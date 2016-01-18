class Admin::VotesController < ApplicationController
  before_action :selector
  before_action :event

  def create
    user_id = current_user.id
    submission_id = params[:submission_id]

    vote = Vote.find_or_create_by(user_id: user_id, submission_id: submission_id)
    if vote.update_attributes!(value: params[:value])
      head :accepted
    end
  end

end
