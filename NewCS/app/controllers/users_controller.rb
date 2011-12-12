class UsersController < ApplicationController
  
  def sign_in
    @user = User.find_all_by_login_and_password(params[:user][:login],params[:user][:password])
    respond_to do |format|
      if ! @user.empty?
        session[:user] = @user[0]        
        session[:user_options] = Setting.find( session[:user][:settings_id])
        format.js
        format.json { render json: @user, status: :created, location: @user }
      else
        format.js
        @errors="error"
        format.json { render json: @errors, status: ":unprocessable_entity" }
      end
    end
  end
  
  def sign_out
    session[:user] = nil
    redirect_to "/"
  end
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    # TODO process errors
    if @user.save
      render :partial => "/users/create"
    else
      render :partial => "/users/create"
    end
  
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
