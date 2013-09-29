class InterviewRelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @interview = Interview.find(params[:relationship][:interview_id])
    @user=current_user
    @user.interviewing_with!(@interview) 
    respond_to do |format|
      format.html { redirect_to @interview }
      format.js
    end	
  end

  def destroy
    @interview = Interview.find(params[:relationship][:interview_id])
    current_user.finished_interview!(@interview)
    redirect_to @interview
        respond_to do |format|
      format.html { redirect_to @interview }
      format.js
    end	
  end

  private

  def signed_in_user
    redirect_to new_user_registration_path, notice:"Please sign in." unless signed_in?
  end


end