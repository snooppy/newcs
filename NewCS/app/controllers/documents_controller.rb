 
class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index 
    
    # curent sign in user
    user_id = session["user"].id
    if !params[:user_id].nil?  
      # some other user
      user_id = params[:user_id]
    end
    
    # TODO get normal level from db
    level = 0
    
    @folder = {:name => "/" , :parent => nil, :id => 0}
    if !params[:folder].nil?
      folder_string = params[:folder]
      folder_string = folder_string.gsub(/(\$\$)/, "/")
      if !folder_string.match(/\//)
        @folder = {:name =>folder_string,:parent => nil, :id => 0}
      else
        sub_strs = folder_string.match(/(.*)\/(.*)$/)
        @folder = {:name =>sub_strs[1],:parent =>sub_strs[2], :id => 0}
      end
    end
    
    @documents_info = {}
    
    @f = Folder.find_by_name_and_parent_and_user_id(@folder[:name], @folder[:parent],user_id)
    if !@f.nil?
      @folder[:id] = @f[:id]

      # get documents form current folder
      @documents = Document.find(:all,
        :select => "*",
        :conditions  => ["level>=(?) and user_id=(?) and folder = (?)", 
          level, user_id, @folder[:id]
        ]
      )                               
      
      # create hash for the page
      @info  = {:folder => @folder}
      @documents_info = {:documents => @documents, :info => @info}
      
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
      folder = params[:folder] # regexp!!
      # save file
      # TODO add проверка
      file = Rails.root.join("public","files",session[:user].id.to_s(),folder,params[:document][:path].original_filename)
      tmp  =  params[:document][:path].tempfile  
      FileUtils.cp tmp.path, file 

      #TODO add some dirs
      
      p folder
      folder_id = Folder.find_by_name(folder)
      params[:document][:path] = File.join( folder, params[:document][:path].original_filename )
      params[:document][:folder] = folder_id
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
