class Selection::VotesController < ApplicationController
  before_action :authenticate_speaker!

  def create
    speaker_id = current_speaker.id
    session_id = params[:session_id]

    vote = Vote.find_or_create_by(speaker_id: speaker_id, session_id: session_id)
    vote.update_attributes!(value: params[:vote])
    render json: Session.find(session_id).to_json(include: :votes)
  end

  def destroy
    vote = Vote.find(params[:id])
    session_id = vote.session_id
    vote.destroy
    render json: Session.find(session_id).to_json(include: :votes)
  end
end
