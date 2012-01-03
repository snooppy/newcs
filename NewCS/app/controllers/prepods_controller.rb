# encoding: utf-8
class PrepodsController < ApplicationController
  # GET /prepods
  # GET /prepods.json
  def index
    @prepods = Student.find_all_by_role ROLE_PREPOD
    @title = "Преподаватели"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prepods }
    end
  end

  # GET /prepods/1
  # GET /prepods/1.json
  def show
    @prepod = Prepod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prepod }
    end
  end

  # GET /prepods/new
  # GET /prepods/new.json
  def new
    @prepod = Prepod.new
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prepod   }
    end
  end

  # GET /prepods/1/edit
  def edit
    if ! session[:user].nil? && params[:id].to_i == session[:user][:id]   
      @prepod = Prepod.find(params[:id])
    else
      redirect_to_back
    end  
  end

  # POST /prepods
  # POST /prepods.json
  def create
    @prepod = Prepod.new(params[:prepod])

    respond_to do |format|
      if @prepod.save
        format.html { redirect_to @prepod, notice: 'Prepod was successfully created.' }
        format.json { render json: @prepod, status: :created, location: @prepod }
      else
        format.html { render action: "new" }
        format.json { render json: @prepod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prepods/1
  # PUT /prepods/1.json
  def update
    @prepod = Prepod.find(params[:id])

    respond_to do |format|
      if @prepod.update_attributes(params[:prepod])
        #        format.html { redirect_to @prepod, notice: 'Prepod was successfully updated.' }
        format.html { redirect_to "/home", notice: 'Prepod was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @prepod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prepods/1
  # DELETE /prepods/1.json
  def destroy
    @prepod = Prepod.find(params[:id])
    @prepod.destroy

    respond_to do |format|
      format.html { redirect_to prepods_url }
      format.json { head :ok }
    end
  end
end
