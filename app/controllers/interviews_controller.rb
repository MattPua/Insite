class InterviewsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /interviews
  # GET /interviews.json
  def index
   	@user=User.find(params[:user_id])
    # get all interviews, and use JS to filter them for display purposes
    @interviews = @user.get_interviews.paginate(:page=>params[:page], :per_page=>10)
    respond_to do |format|
      format.html  { render "/users/interviews/index" }# index.html.erb
      format.json { render json: @interviews }
    end
  end
  # GET /interviews/1
  # GET /interviews/1.json
  def show

    @interview = Interview.find(params[:id])
    #@user=User.find(@interview.user_id)
    # Using the current interview, find the associated company
    @company = Company.find_by_name(@interview.company_name)
    respond_to do |format|
      format.html { render "users/interviews/show" }# show.html.erb
      format.json { render json: @interview }
    end
  end

  # GET /interviews/new
  # GET /interviews/new.json
  def new
    @interview = Interview.new
    respond_to do |format|
      format.html { render "/users/interviews/new" }# new.html.erb
      format.json { render json: @interview }
    end
  end

  # GET /interviews/1/edit
  def edit
    @interview = Interview.find(params[:id])
    respond_to do |format|
      format.html { render "/users/interviews/edit"} # edit.html.erb
      format.json { render json: @interview }
    end
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new(params[:interview])
    # Find the company using the parameters that the user filled in when creating the interview
    @company=Company.where("name= ?", params[:interview][:company_name]).first
    # If no company is found, create a new company
    if @company.nil?
      @company=Company.new
      @company.industry=params[:company][:industry]
      @company.name=params[:interview][:company_name]
      if !@company.save
        format.html {render action: "new"}
        format.json {render json: @company.errors, status: :unprocessable_entity}
      end
      # Need to double check this works properly and create better fall-back
    end
    # Checks all companies to see if the company already exists, don't know why I have to grab first though.
    # Need to probably fix that. also move to Helpers
    @interview.company_id = @company.id
    @interview.user_id = current_user.id
    @interview.format_date(params[:interview][:date])
    @interview.status = @interview.format_status(params[:interview][:status])
    respond_to do |format|
      if @interview.save
        format.html { redirect_to user_interview_path(current_user,@interview), notice: 'Interview was successfully created.' }
        format.json { render json: @interview, status: :created, location: @interview }
      else
        format.html { render "/users/interviews/new" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interviews/1
  # PUT /interviews/1.json
  def update
    @interview = Interview.find(params[:id])
    @company=Company.where("name= ?", params[:interview][:company_name]).first
    # If no company is found, create a new company
    if @company.nil?
      @company=Company.new
      @company.name=params[:interview][:company_name]
      if !@company.save
        format.html {render action: "edit"}
        format.json {render json: @company.errors, status: :unprocessable_entity}
      end
      # Need to double check this works properly and create better fall-back
    end
    # Checks all companies to see if the company already exists, don't know why I have to grab first though.
    # Need to probably fix that. also move to Helpers
    @interview.company_id = @company.id

    @interview.format_date(params[:interview][:date])
    @interview.status = @interview.format_status(params[:interview][:status])
    respond_to do |format|
      if @interview.save
        format.html { redirect_to user_interview_path(current_user,@interview), notice: 'Interview was successfully edited.' }
        format.json { render json: @interview, status: :created, location: @interview }
      else
        format.html { render "/users/interviews/edit" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    # Currently not using this
    @interview = Interview.find(params[:id])
    @interview.destroy
   
    respond_to do |format|
      format.html { redirect_to user_path(current_user), :notice =>"Interview successfully deleted" }
      format.json { redirect_to user_path(current_user), :notice =>"Interview successfully deleted"  }
    end
  end

end
