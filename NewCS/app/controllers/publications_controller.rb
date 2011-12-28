# encoding: utf-8
class PublicationsController < ApplicationController
  # GET /publications
  # GET /publications.json
  def index
    @title = "Публикации"
    @pages_col=0
    on_page = 6
    todo = "latest"
    todo = params[:todo] unless params[:todo].nil?
    page = 0
    page = params[:page].to_d.to_int unless params[:page].nil?
    cond =""
    cond = params[:cond] unless params[:cond].nil?
    level = 5
    level = session[:user].role unless session[:user].nil?
    conds = cond.split(/\+/)
    start = (page)*on_page
    # TODO count = tratata if > than tratataa
    @publications = {}
    if todo == 'latest'
      @publications = Publication.find(:all,
        :select   => "*",
        :order    => "created_at desc",
        :limit    => on_page,
        :conditions => [ "level >= ?", level],
        :offset   => start,
        :include  => :subjects
      )
      @pages_col=Publication.count(
        :conditions => [ "level >= ?", level]
      )
      if @pages_col > on_page
        @pages_col= @pages_col/on_page
      end

    else if todo == 'bysubj'
        subjs=conds
        @publications = Publication.find(:all,
          :select    => "*",
          :limit     => on_page,
          :include  => :subjects,
          :conditions => {:subjects=>{:id=>subjs}},
          :offset    => start
        )
      else if todo == 'byuser'
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
  
  def for_index
    # TODO change level to 5 !!!!
    @pubs = Publication.find(:all,:select=>"*",:order=>"created_at",:conditions=>"level=0",:limit=>"3")
    p @pubs
    render "for_index", :layout=>false
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
    unless params[:publication][:photo].nil?
      file = Rails.root.join("app","assets","images","from_users",session[:user].id.to_s(),params[:publication][:photo].original_filename)
      tmp  =  params[:publication][:photo].tempfile  
      FileUtils.cp tmp.path, file 
      p params[:publication]
      params[:publication][:photo] = File.join("from_users",session[:user].id.to_s(),params[:publication][:photo].original_filename)
    end
    params[:publication][:user_id] = session[:user].id
    @publication = Publication.new(params[:publication])
    respond_to do |format|
      if @publication.save
        format.html { redirect_to "/publication/"+@publication.id.to_s() }
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
        format.html { redirect_to @publication, notice: 'Публикация успешно обновлена.' }
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
