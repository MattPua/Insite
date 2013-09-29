class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @company = Company.find(params[:relationship][:company_id])
    @user=current_user
    @user.works_at!(@company) 
    respond_to do |format|
      format.html { redirect_to @company }
      format.js
    end	
  end

  def destroy
    @company = Relationship.find(params[:id]).worked_for
    current_user.fired!(@company)
    redirect_to @company
        respond_to do |format|
      format.html { redirect_to @company }
      format.js
    end	
  end

  private

  def signed_in_user
    redirect_to new_user_registration_path, notice:"Please sign in." unless signed_in?
  end


end