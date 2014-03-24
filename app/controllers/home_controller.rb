class HomeController < ApplicationController
  # Before all actions, all users must be authenticated
  skip_authorization_check
  before_filter :authenticate_user!, except: [:index]
  def index
  	@user = User.new
  	if user_signed_in?
  		redirect_to main_path
  	end
  end
  
  def main 
    # @all_users = User.all
    # @user=current_user
    # # If the current_user has any ongoing interviews
    # if @user.has_active_interview?
    #   # Get the next upcoming interview
    #   @company = Company.find(@user.next_interview.company_id)
    #   @relevant_users=[]
    #   @all_users.each do |user|
    #     if user.companies.include?(@company) && user!=@user
    #       @relevant_users.push(user)
    #     # Create new array to hold users w/ similar industry or positions, not just same company
    #     # Find way to shorten this action, will take long time. Maybe instead using SQL grab all the users with the same company?
    #     end
    #   end
    # end
    # @interview=Interview.new(params[:interview])
    @next_interviews = current_user.three_next_interviews
    @random_interviews=Array.new
    total_interviews=Interview.count
    i = 0
    while i < 6 do    # get three random interviews to show on main page
      y= rand(1..total_interviews)
      if (!Interview.where(:id=>y, :status=>1).empty?)
        if (!@random_interviews.include?(Interview.where(:id=>y,:status=>1)))
          @random_interviews.push(Interview.find(y))
          i+=1
        end
      end
    end

  end

  private

end
