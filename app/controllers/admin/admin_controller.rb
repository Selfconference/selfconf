class Admin::AdminController < ApplicationController
  before_filter :authenticate_speaker!
  before_action :authorize_admin!

end
