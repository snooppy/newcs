 
class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index 
    # TODO get normal level from db
    level = 0
    full_path = params[:folder]
    # curent sign in user
    user_id = session["user"].id unless session["user"].nil?
   
    # some other user
    user_id = params[:user_id]  unless params[:user_id].nil?  
    
    full_path = "" if !session["user"].nil? and session["user"].id == user_id and params[:folder].nil?
    
    if user_id.nil? and params[:folder].nil?
      redirect_to "/403.html" 
      return 1
    end
    
    @current_folder = {} 
    error = ""
    unless full_path.nil?
      unless full_path.match(/\//)
        if full_path == ""
          @current_folder = Folder.find_by_user_id_and_name(user_id,"")
        else
          folder_root = Folder.find_by_user_id_and_name(user_id,"").id
          @current_folder = Folder.find_by_name_and_parent(full_path,folder_root)
        end
      else
        folder_names = full_path.gsub(/\//," ").split
        # TODO add IF FOLDER EXIST
        unless File.exist?(full_path)
          error = "path is wrong"
        end
        folder_root = Folder.find_by_user_id_and_name(user_id,"").id
        sql = folder_root.to_s()
        folder_names.each do |f_name|
          sql = "select id from folders where name = ('" + f_name  + "') and parent = (" + sql + ")"
        end
         
        if current_folder_id = Folder.find_by_sql(sql)
          @current_folder = Folder.find(:first,
            :select => "*",
            :conditions  => ["level>=(?) and id = (?)", 
              level, current_folder_id
            ]
          )
        end
      end
    else
      @current_folder = Folder.find_by_user_id_and_name(user_id,"")
      full_path = ""
    end
    
    @documents_info = {}
  
    unless @current_folder.nil?
      
      # get documents form current folder
      @documents = Document.find(:all,
        :select => "*",
        :conditions  => ["level>=(?) and folder = (?)", 
          level, @current_folder[:id]
        ]
      ) 
      
      # get documents form current folder
      @folders = Folder.find(:all,
        :select => "*",
        :conditions  => ["level>=(?) and parent = (?)", 
          level, @current_folder[:id]
        ]
      )  
      
      # create hash for the page
      @info  = {:folder => @current_folder,:full_path => full_path}
      @documents_info = {:documents => @documents,:folders => @folders, :info => @info}
      
    else
      # error Folder path is incorrect
      @documents_info = {:error => "Folder path is incorrect"}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents_info }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    if !session[:user].nil?
      level = 0 # TODO add normal level
      # TODO add checking own access level
      folder_id = params[:folder]
      full_path = params[:full_path]
             
      # save file
      # TODO add проверка
      file = Rails.root.join("public","files",session[:user].id.to_s(),full_path,params[:document][:path].original_filename)
      tmp  =  params[:document][:path].tempfile  
      FileUtils.cp tmp.path, file 

      #TODO add some dirs
      params[:document][:path]    = params[:document][:path].original_filename 
      params[:document][:folder]  = folder_id
      params[:document][:user_id] = session[:user].id
      params[:document][:level] = level
      @document = Document.new(params[:document])
      if @document.save
        render :partial => "create.js"
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    else
      redirect_to "/403.html"
    end

  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :ok }
    end
  end
end
