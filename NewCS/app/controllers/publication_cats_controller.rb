class PublicationCatsController < ApplicationController
  
  # GET /publication_cats
  # GET /publication_cats.json
  def index
    @publication_cats = PublicationCat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publication_cats }
    end
  end

  # GET /publication_cats/1
  # GET /publication_cats/1.json
  def show
    @publication_cat = PublicationCat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @publication_cat }
    end
  end

  # GET /publication_cats/new
  # GET /publication_cats/new.json
  def new
    layout "none"
    @publication_cat = PublicationCat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @publication_cat }
    end
  end

  # GET /publication_cats/1/edit
  def edit
    @publication_cat = PublicationCat.find(params[:id])
  end

  # POST /publication_cats
  # POST /publication_cats.json
  def create
    @publication_cat = PublicationCat.new(params[:publication_cat])

    respond_to do |format|
      if @publication_cat.save
        format.html { redirect_to @publication_cat, notice: 'Publication cat was successfully created.' }
        format.js
        format.json { render json: @publication_cat  }
      else
        format.html { render action: "new" }
        format.js
        format.json { render json: @publication_cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /publication_cats/1
  # PUT /publication_cats/1.json
  def update
    @publication_cat = PublicationCat.find(params[:id])

    respond_to do |format|
      if @publication_cat.update_attributes(params[:publication_cat])
        format.html { redirect_to @publication_cat, notice: 'Publication cat was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @publication_cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_cats/1
  # DELETE /publication_cats/1.json
  def destroy
    @publication_cat = PublicationCat.find(params[:id])
    @publication_cat.destroy

    respond_to do |format|
      format.html { redirect_to publication_cats_url }
      format.json { head :ok }
    end
  end
end
