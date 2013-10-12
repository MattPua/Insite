class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error]=  exception.message
    redirect_to current_user
  end

  private 
  # The route that will load after a use has signed in
  def after_sign_in_path_for(resource)	
    main_path
  end

  # Default path for users after they sign out
  def after_sign_out_path_for(resource)
  	root_path
  end


end
