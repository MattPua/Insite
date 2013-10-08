class HomeController < ApplicationController
  before_filter :get_current_user
  before_filter :authenticate_user!, except: [:index]
  def index

  	@user = User.new
  	if user_signed_in?
  		redirect_to main_path
  	end
  end
  
  def main 
    @all_users = User.all
    if @user.has_interview?
      @company = Company.find(@user.next_interview.company_id)
      @relevant_users=[]
      @all_users.each do |user|
        if user.companies.include?(@company) && user!=@user
          @relevant_users.push(user)
        # Create new array to hold users w/ similar industry or positions, not just same company
        # Find way to shorten this action, will take long time. Maybe instead using SQL grab all the users with the same company?
        end
      end
    end


    
  end

  private
  def get_current_user
  	@user = current_user
  end
end
