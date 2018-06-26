class Admin::AdminController < ApplicationController
  before_action :authenticate_speaker!
  before_action :authorize_admin!

end
