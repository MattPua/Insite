class RelationshipsController < ApplicationController
  before_action :signed_in_user

  def create
    @company = User.find(params[:relationship][:company_id])
    current_user.works_at!(@company)
    redirect_to @company
  end


end