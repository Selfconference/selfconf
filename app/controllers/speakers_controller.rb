class SpeakersController < ApplicationController

  def index
    speakers = @event.speakers
    speakers = speakers.where('updated_at > ?', params[:from_date]) if params[:from_date]
    render json: speakers.map(&:decorate).to_json(except: [:encrypted_password, :password_salt, :created_at, :updated_at, :reset_password_token, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :reset_password_sent_at])
  end

  def show
    render json: Speaker.find(params[:id]).decorate.to_json(:include => [:sessions])
  end

end
