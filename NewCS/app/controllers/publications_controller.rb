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
    @page = 0
    @page = params[:page].to_d.to_int unless params[:page].nil?
    cond =""
    cond = params[:cond] unless params[:cond].nil?
    level = 5
    level = session[:user].role unless session[:user].nil?
    conds = cond.split(/\+/)
    start = (@page)*on_page
    # TODO count = tratata if > than tratataa
    @publications = {}
    if todo == 'latest'
      @publications = Publication.find(:all,
        :select   => "*",
        :order    => "created_at desc",
        :limit    => on_page,
        :conditions => [ "level >= ? and not_validated = 0", level],
        :offset   => start,
        :include  => :subjects
      )
      @pages_col=Publication.count(
        :conditions => [ "level >= ? and not_validated = 0", level]
      )
      if @pages_col > on_page
        @pages_col= @pages_col/on_page
      else
        @pages_col=0
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
        
        else if todo == 'not_validated'
            @publications = Publication.find(:all,
              :select   => "*",
              :order    => "created_at",
              :limit    => on_page,
              :offset   => start,
              :conditions => "not_validated = 1")
          end
        end
      end
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publications }
    end
  end
  
  def for_index
    level = 5
    level = session[:user].role unless session[:user].nil?
    @pubs = Publication.find(:all,:select=>"*",:order=>"created_at desc",:conditions=>[ "level >= ?", level],:limit=>"3")
    p @pubs
    render "for_index", :layout=>false
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    @publication = Publication.find(params[:id])
    @title = @publication.title
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @publication }
    end
  end

  # GET /publications/new
  # GET /publications/new.json
  def new
    if ! session[:user].nil?
      @title = "Добавление новой публикации"            
      @publication = Publication.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @publication }
      end
      
    else
      redirect_to_back
    end
    
  end

  # GET /publications/1/edit
  def edit
    @publication = Publication.find(params[:id])
    @title = "Правка публикации \""+@publication.id+"\""
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
    params[:publication][:not_validated] = 1
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
        format.html { redirect_to "/publication/"+@publication.id.to_s(), notice: 'Публикация успешно обновлена.' }
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
  
  def make_valid
    @publication = Publication.find(params[:id])
    @publication.update_attribute("not_validated", 0)

    respond_to do |format|
      format.html { redirect_to "/publications/not_validated/0" }
      format.json { head :ok }
    end
  end
  
end
