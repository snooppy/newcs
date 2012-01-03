# encoding: utf-8
class FormerUsersController < ApplicationController
  # GET /former_users
  # GET /former_users.json
  def index
    if !session[:user].nil? &&  session[:user][:role] == ROLE_ADMIN
      @former_users = FormerUser.all
      @title = "Удаленные пользователи"

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @former_users }
      end
    else
      redirect_to_back
    end
  end

  # GET /former_users/1
  # GET /former_users/1.json
  def show
    @former_user = FormerUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @former_user }
    end
  end

  # GET /former_users/new
  # GET /former_users/new.json
  def new
    @former_user = FormerUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @former_user }
    end
  end

  # GET /former_users/1/edit
  def edit
    @former_user = FormerUser.find(params[:id])
  end

  # POST /former_users
  # POST /former_users.json
  def create
    @former_user = FormerUser.new(params[:former_user])

    respond_to do |format|
      if @former_user.save
        format.html { redirect_to @former_user, notice: 'Former user was successfully created.' }
        format.json { render json: @former_user, status: :created, location: @former_user }
      else
        format.html { render action: "new" }
        format.json { render json: @former_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /former_users/1
  # PUT /former_users/1.json
  def update
    @former_user = FormerUser.find(params[:id])

    respond_to do |format|
      if @former_user.update_attributes(params[:former_user])
        format.html { redirect_to @former_user, notice: 'Former user was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @former_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /former_users/1
  # DELETE /former_users/1.json
  def destroy
    @former_user = FormerUser.find(params[:id])
    @former_user.destroy

    respond_to do |format|
      format.html { redirect_to former_users_url }
      format.json { head :ok }
    end
  end
  
  def forbiden
    "/pages/403.html.erb"
  end
end
