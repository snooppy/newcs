# encoding: utf-8
class SheduleBlocksController < ApplicationController
  # GET /shedule_blocks
  # GET /shedule_blocks.json
  def index
    @shedule_blocks = SheduleBlock.find_all_by_role ROLE_STUDENT
    @title = "Студенты"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shedule_blocks }
    end
  end

  # GET /shedule_blocks/1
  # GET /shedule_blocks/1.json
  def show    
    if ! session[:user].nil? && params[:id].to_i == session[:user][:id]
      @shedule_block = SheduleBlock.find(params[:id])
    
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @shedule_block }
      end
    else
      redirect_to_back
    end  
  end

  # GET /shedule_blocks/new
  # GET /shedule_blocks/new.json
  def new
    @shedule_block = SheduleBlock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shedule_block }
    end
  end

  # GET /shedule_blocks/1/edit
  def edit
    if ! session[:user].nil? && params[:id].to_i == session[:user][:id]      
      @shedule_block = SheduleBlock.find(params[:id])
    else
      redirect_to_back
    end   
  end

  # POST /shedule_blocks
  # POST /shedule_blocks.json
  def create
    @shedule_block = SheduleBlock.new(params[:shedule_block])

    respond_to do |format|
      if @shedule_block.save
        format.html { redirect_to @shedule_block, notice: 'SheduleBlock was successfully created.' }
        format.json { render json: @shedule_block, status: :created, location: @shedule_block }
      else
        format.html { render action: "new" }
        format.json { render json: @shedule_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shedule_blocks/1
  # PUT /shedule_blocks/1.json
  def update
    @shedule_block = SheduleBlock.find(params[:id])

    respond_to do |format|
      if @shedule_block.update_attributes(params[:shedule_block])
        #format.html { redirect_to @shedule_block, notice: 'SheduleBlock was successfully updated.' }
        format.html { redirect_to "/home", notice: 'Информация успешно обновлена.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @shedule_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shedule_blocks/1
  # DELETE /shedule_blocks/1.json
  def destroy
    @shedule_block = SheduleBlock.find(params[:id])
    @shedule_block.destroy

    respond_to do |format|
      format.html { redirect_to shedule_blocks_url }
      format.json { head :ok }
    end
  end
end
