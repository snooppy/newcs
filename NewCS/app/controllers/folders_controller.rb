class FoldersController < ApplicationController
  # GET /folders
  # GET /folders.json
  def index
    @folders = Folder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folders }
    end
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    @folder = Folder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/new
  # GET /folders/new.json
  def new
    @folder = Folder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/1/edit
  def edit
    @folder = Folder.find(params[:id])
  end

  # POST /folders
  # POST /folders.json
  def create
    unless session[:user].nil?
      @error = ""
      level  = 0
      # TODO take level from form
      params[:folder][:parent]  = params[:parent_folder]
      full_path  = params[:full_path]
      params[:folder][:user_id] = session[:user].id
      params[:folder][:level]   = level
      @folder = Folder.new(params[:folder])
      
      #huinya parent_path = Folder.find_by_user_id_and_id(params[:parent_folder],session[:user].id)
      unless params[:parent_folder].nil?
        folder_path = Rails.root.join("public","files",session[:user].id.to_s(),full_path,params[:folder][:name])
        begin
          Dir::mkdir(folder_path)
          @folder.save
        rescue
          @error = "The directory already exists"
        end
      else
        @error = "Operation not permitted"
      end
       
      respond_to do |format|
        format.js   
        format.json{render json: @error}
      end
    else
      redirect_to "/403.html"
    end
  end
  # PUT /folders/1
  # PUT /folders/1.json
  def update
    @folder = Folder.find(params[:id])

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url }
      format.json { head :ok }
    end
  end
end
