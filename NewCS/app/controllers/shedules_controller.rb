class ShedulesController < ApplicationController
  # GET /shedules
  # GET /shedules.json
  def get_group 
    @shedules = nil
    unless params[:groups_id].nil?
      @shedules = Shedule.find(:all,:conditions=>{:groups=>{:id=>params[:groups_id]}},:include=>[:groups,:subject],:order=>[:day,:hour])
      @shedules.each do |s|
        s[:groups] = params[:groups_id];
      end
    end
    render "get_group", :layout=>false
  end
  
  def get_shedule 
    # TODO add supporting multi groups
    @shedule= Shedule.find(:all,:conditions=>{:groups=>{:id=>params[:groups_id]},:day=>params[:day],:hour=>params[:hour]},:include=>[:groups,:subject],:order=>[:day,:hour])[0]
    if @shedule.nil?
      new_shedule = {}
      new_shedule[:group_ids] = [params[:groups_id]]
      new_shedule[:day] = params[:day]
      new_shedule[:hour] = params[:hour]
      p new_shedule
      @shedule = Shedule.new(new_shedule)
      @shedule.save
    end
    @shedule[:groups] = params[:groups_id]
    render "get_shedule", :layout=>false
  end
  
  def index
    @shedule_block = SheduleBlock.all[0]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shedule_block }
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
    ################ shit ################
    groups = params[:shedule][:group_ids].gsub(/(\[|\])/,"") # shit
    groups_arr = [] # shit
    groups.split(/\s*,\s*/).each do |g|   # shit
      groups_arr << g.to_i # shit
    end # shit
    params[:shedule][:group_ids] =groups_arr # shit
    ################
    @shedule = Shedule.new(params[:shedule])
    respond_to do |format|
      if @shedule.save
        @new_shedule = params[:shedule]
        format.js
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
    ################ shit ################
    groups = params[:shedule][:group_ids].gsub(/(\[|\])/,"") # shit
    groups_arr = [] # shit
    groups.split(/\s*,\s*/).each do |g|   # shit
      groups_arr << g.to_i # shit
    end # shit
    params[:shedule][:group_ids] =groups_arr # shit
    ################
    respond_to do |format|
      if @shedule.update_attributes(params[:shedule])
        @shedule[:groups] = params[:shedule][:group_ids][0]
        format.js
      else
        render :inline => "fail"
      end
    end
  end
  
  def merge_shedules
    shedule_del = Shedule.find(:all,:conditions=>{:groups=>{:id=>params[:group2_id]},:day=>params[:day],:hour=>params[:hour]},:include=>[:groups])[0] # this group should be removed
    shedule_del.destroy unless shedule_del.nil?
    shedule = Shedule.find(:all,:conditions=>{:groups=>{:id=>params[:group1_id]},:day=>params[:day],:hour=>params[:hour]},:include=>[:groups])[0] # this group is present 100%
    shedule.group_ids = [params[:group1_id],params[:group2_id]]
    if shedule.save
      render :inline => "ok"
    else
      render :inline => "fail"
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
