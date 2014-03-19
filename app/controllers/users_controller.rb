class UsersController < ApplicationController
  # Make sure the user has the correct authentication for their action, and check if the user is an admin 
  # only for destroying users
  load_and_authorize_resource
  before_filter :authenticate_user!
  before_filter :admin_user, only: :destroy


  # GET /users
  # GET /users.json
  def index

    @users=User.order("LOWER(name)").paginate(:page=>params[:page], :per_page =>12)
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end


  # GET /users/1
  # GET /users/1.json
  def show
    @user=User.find(params[:id])
    @companies=@user.companies
    # Get only the active interviews
    @active_interviews = @user.active_interviews
    @finished_interviews=@user.finished_interviews

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
  @user=User.new

  end

  # GET /users/1/edit
  def edit
    @user=User.find(params[:id])
  end


  # POST /users
  # POST /users.json
  def create
    
    # @user = User.new(params[:user])
    @user= User.new(user_params)

   respond_to do |format|
     if @user.save
       format.html { redirect_to @user, notice: 'User was successfully created.' }
       format.json { render json: @user, status: :created, location: @user }
      else
       format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def works_for
    # currently not using this
    @user = current_user
    @company = Company.find(params[:id])
    @companies = @company.worked_for.paginate(page: params[:page])
    render 'show_worked_for'
  end

 
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user=User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user=User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

private
  def admin_user
    # Redirect them to the root page unless the status of the current_user.admin is true
    redirect_to(:root) unless current_user.admin?
  end

end
