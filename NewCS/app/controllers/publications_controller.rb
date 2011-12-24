# encoding: utf-8
class PublicationsController < ApplicationController
  # GET /publications
  # GET /publications.json
  def index
    @title = "Публикации"
    on_page = 4
    todo = "latest"
    todo = params[:todo] unless params[:todo].nil?
    page = 0
    page = params[:page].to_d.to_int unless params[:page].nil?
    conditions =""
    conditions = params[:cond] unless params[:cond].nil?
    cons = conditions.split(/\+/)
    start = (page)*on_page
    # TODO count = tratata if > than tratataa
    @publications = {}
    if todo == 'latest'
      @publications = Publication.find(:all,
        :select   => "*",
        :order    => "created_at",
        :limit    => on_page,
        :offset   => start,
        :include  => :subjects
      )
    else if todo == 'bysubject'
        subjs=cons
        
        @publications = Publication.find(:all,
          :select    => "*",
          :limit     => on_page,
          :include  => :subjects,
          :conditions => {:subjects=>{:id=>subjs}},
          :offset    => start
        )
      else if todo == 'bytype'
          @publications = Publication.find(:all,
            :select   => "*",
            :order    => "created_at",
            :limit    => on_page,
            :offset   => start)
        end
      end
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publications }
    end
  end
  

  # GET /publications/1
  # GET /publications/1.json
  def show
    @publication = Publication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @publication }
    end
  end

  # GET /publications/new
  # GET /publications/new.json
  def new
    @title = "Добавление новой публикации"
    @publication = Publication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @publication }
    end
  end

  # GET /publications/1/edit
  def edit
    @publication = Publication.find(params[:id])
  end

  # POST /publications
  # POST /publications.json
  def create
    
    file = Rails.root.join("app","assets","images","from_users",session[:user].id.to_s(),params[:publication][:photo].original_filename)
    tmp  =  params[:publication][:photo].tempfile  
    FileUtils.cp tmp.path, file 
    p params[:publication]
    params[:publication][:photo] = File.join("from_users",session[:user].id.to_s(),params[:publication][:photo].original_filename)
    params[:publication][:user_id] = session[:user].id
    @publication = Publication.new(params[:publication])
    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render json: @publication, status: :created, location: @publication }
      else
        format.html { render action: "new" }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /publications/1
  # PUT /publications/1.json
  def update
    unless params[:publication][:photo].nil?
      file = Rails.root.join("app","assets","images","from_users",session[:user].id.to_s(),params[:publication][:photo].original_filename)
      tmp  =  params[:publication][:photo].tempfile  
      FileUtils.cp tmp.path, file 
      p params[:publication]
      params[:publication][:photo] = File.join("from_users",session[:user].id.to_s(),params[:publication][:photo].original_filename)
    end
    @publication = Publication.find(params[:id])

    respond_to do |format|
      if @publication.update_attributes(params[:publication])
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to publications_url }
      format.json { head :ok }
    end
  end
end
