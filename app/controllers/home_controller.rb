class HomeController < ApplicationController
  before_filter :get_current_user
  def index
  	
  end

  def get_current_user
  	@user = current_user
  end
end
