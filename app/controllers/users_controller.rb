class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :latest_event

  def index
    admin

    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Logged in"
      redirect_to event_submissions_path(@event)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
     params.require(:user).permit(:name, :email, :twitter, :bio, :headshot, :password,
                                  :password_confirmation)
   end

   def latest_event
     @event = Event.latest
   end
end
