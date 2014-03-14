class InterviewsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /interviews
  # GET /interviews.json
  def index
    # Currently not using index page
    @interviews = Interview.find(params[:id])
    respond_to do |format|
      format.html  { render "/users/interviews/index" }# index.html.erb
      format.json { render json: @interviews }
    end
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
    @interview = Interview.find(params[:id])
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
    # should change this to be in javascript instead of here
    @interview = Interview.new(params[:interview])
    #@company=Company.where(:name => params[:interview][:company_name])
    # Find the company using the parameters that the user filled in when creating the interview
    @company=Company.where("name= ?", params[:interview][:company_name]).first
    # If no company is found, create a new company
    if @company.nil?
      @company=Company.new
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

    @interview.format_date(params[:interview][:date])
    @interview.format_status(params[:interview][:status])
    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
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
    @company=@interview.company
    # if the company name in the parameters does not match the existing company name then change the company_id to the 
    # new id of the correct company
    if @company.name!=params[:interview][:company_name]
      params[:interview][:company_id]=Company.find_by_name(params[:interview][:company_name]).id
    end
    # have to watch out when company name doesn't exist
    respond_to do |format|
      if @interview.update_attributes(params[:interview])
        # if the status of the interview has changed (user has finished their interview) 
        if params[:interview][:status]==1
          format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to :root, notice: 'Interview was successfully updated.' }
          format.json { head :no_content}
        end
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
    # @interview.destroy
    @interview.status=2
    # don't actually destroy interviews, instead just archive them. Make them not accessible generally

    respond_to do |format|
      format.html { redirect_to :root }
      format.json { redirect_to :root }
    end
  end

end
