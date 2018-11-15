class Accounts::SessionsController < ApplicationController
  before_action :authenticate_speaker!, except: :index

  def index
    if speaker_signed_in?
      @sessions = current_speaker.sessions.where(event_id: @event)
      @talks = current_speaker.sessions.selected
    end
  end

  def show
    @session = Session.find(params[:id])
    authorize(@session, :show?)
  end

  def new
    @session = @event.sessions.build(speakers: [current_speaker])
  end

  def edit
    @session = Session.find(params[:id])
    authorize @session
  end

  def create
    @session = @event.sessions.build(session_params.merge(speakers: [current_speaker]))
    if @session.save
      flash[:success] = "Talk submitted!"
      redirect_to accounts_sessions_path
    else
      render "new"
    end
  end

  def update
    @session = Session.find(params[:id])
    authorize @session
    if @session.update_attributes(session_params)
      @session.votes.destroy_all
      flash[:success] = "Talk updated!"
      redirect_to accounts_sessions_path
    else
      render "edit"
    end
  end

  def destroy
    @session = Session.find(params[:id])
    authorize @session
    if @session.destroy
      flash[:success] = "Talk destroyed."
    else
      flash[:danger] = "Talk could not be destroyed, please try again."
    end
    redirect_to accounts_sessions_path
  end

  private

  def session_params
    params.require(:session).permit(:name, :abstract, :talktype, :notes)
  end
end
