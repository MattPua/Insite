class RelationshipsController < ApplicationController
  

  def create
    @company = User.find(params[:relationship][:company_id])
    current_user.works_at!(@company)
    redirect_to @company
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end	
  end


end