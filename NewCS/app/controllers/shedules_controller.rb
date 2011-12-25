class ShedulesController < ApplicationController
  # GET /shedules
  # GET /shedules.json
  def get_one_shedule_form
    @shedule = Shedule.new
    @shedule[:hour]=params[:hour]
    render "get_one_shedule_form", :layout=>false
  end
  
  def index
    @shedules = Shedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shedules }
    end
  end

  # GET /shedules/1
  # GET /shedules/1.json
  def show
    @shedule = Shedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shedule }
    end
  end

  # GET /shedules/new
  # GET /shedules/new.json
  def new
    @shedule = Shedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shedule }
    end
  end

  # GET /shedules/1/edit
  def edit
    @shedule = Shedule.find(params[:id])
  end

  # POST /shedules
  # POST /shedules.json
  def create
    @shedule = Shedule.new(params[:shedule])

    respond_to do |format|
      if @shedule.save
        format.html { redirect_to @shedule, notice: 'Shedule was successfully created.' }
        format.json { render json: @shedule, status: :created, location: @shedule }
      else
        format.html { render action: "new" }
        format.json { render json: @shedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shedules/1
  # PUT /shedules/1.json
  def update
    @shedule = Shedule.find(params[:id])

    respond_to do |format|
      if @shedule.update_attributes(params[:shedule])
        format.html { redirect_to @shedule, notice: 'Shedule was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @shedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shedules/1
  # DELETE /shedules/1.json
  def destroy
    @shedule = Shedule.find(params[:id])
    @shedule.destroy

    respond_to do |format|
      format.html { redirect_to shedules_url }
      format.json { head :ok }
    end
  end
end
