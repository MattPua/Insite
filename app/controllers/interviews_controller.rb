class InterviewsController < ApplicationController
  # GET /interviews
  # GET /interviews.json
  def index
    @user = current_user
    @interviews = @user.interviews

    respond_to do |format|
      format.html  { render "/users/interviews/index" }# index.html.erb
      format.json { render json: @interviews }
    end
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
    @user=current_user
    @interview = Interview.find(params[:id])
    @company = Company.find_by_name(@interview.company_name)
    respond_to do |format|
      format.html { render "/users/interviews/show" }# show.html.erb
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
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new(params[:interview])
    #@company=Company.where(:name => params[:interview][:company_name])
    @company=Company.where("name= ?", params[:interview][:company_name]).first
    if @company.nil?
      @company=Company.new
      @company.name=params[:interview][:company_name]
      if !@company.save
        format.html { render "/users/interviews/new"}
        format.json {render json: @company.errors, status: :unprocessable_entity}
      end
      # Need to double check this works properly and create better fall-back
    end
    # Checks all companies to see if the company already exists, don't know why I have to grab first though.
    # Need to probably fix that. also move to Helpers
    @interview.company_id = @company.id
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

    respond_to do |format|
      if @interview.update_attributes(params[:interview])
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "/users/interviews/edit" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    respond_to do |format|
      format.html { redirect_to interviews_url }
      format.json { head :no_content }
    end
  end
end
