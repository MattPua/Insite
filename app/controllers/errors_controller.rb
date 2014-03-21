class ErrorsController < ApplicationController
 
  def routing_error
    p "routing error path: #{params[:path]}"
    redirect_to "/"
  end

  def unauthorized
  end

  def not_found
  end

  def error
  end

 
end