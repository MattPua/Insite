class HomeController < ApplicationController
  before_filter :get_current_user
  before_filter :authenticate_user!, except: [:index]
  def index
  	@user = User.new
  	if user_signed_in?
  		redirect_to users_path
  	end
  end
  
  def main 
	@user = User.new

end

  def get_current_user
  	@user = current_user
  end
end
