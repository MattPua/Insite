class SearchController < ApplicationController
  def index
  	if params[:user_search].present?
      @users= User.search(params[:user_search])
    elsif params[:company_search].present?
      @companies=Company.search_by_company(params[:company_search])
    elsif params[:interview_search].present?
      @interviews=Interview.search_by_interview(params[:interview_search])
    else
      @users=User.all
    end
    @user= current_user
   #@total=User.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
end
