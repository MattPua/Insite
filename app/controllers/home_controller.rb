class HomeController < ApplicationController
  before_filter :get_current_user
  def index
  	@user = User.new
  	if user_signed_in?
  		redirect_to users_path
  	end
  end

  def get_current_user
  	@user = current_user
  end
end
