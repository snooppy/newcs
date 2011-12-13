# encoding: utf-8
class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @message = Message.all.last(1) 
    
  end

  def dialogs
    # TODO add if users send mess to smb and havn`t ask
    if !session[:user].nil?
      @messages = Message.find(:all,
        :select => "*", 
        :group => "userfrom_id, userto_id", 
        :having => ["userfrom_id = (?) or userto_id = (?)",
          session[:user], 
          session[:user]
        ]
      )   
      @dialog_info = []
      @messages.each do |m|
        if m.userfrom_id != session[:user].id
          user_from = m.userfrom_id
        else
          user_from = m.userto_id
        end
        @info = {:user_from => user_from, :user_to => session[:user].id }
        @dialog_info << {:message => m, :info => @info}
      end
      respond_to do |format|
        format.html # dialogs.html.erb
        format.json { render json: @dialog_info }
        format.js
      end
    end
  end
  
  def dialog
    if !session[:user].nil?
      user_from = params[:id]
      @messages = Message.find(
        :all, 
        :select => "*", 
        :order => "created_at", 
        :conditions => [ 
          "(userfrom_id = (?) and userto_id = (?)) or userfrom_id = (?) and userto_id = (?)", 
          user_from, 
          session[:user].id, 
          session[:user].id, 
          user_from,
        ])
      @info = {:user_from => user_from, :user_to => session[:user].id }
      @dialog_info = {:messages => @messages, :info => @info}
      respond_to do |format|
        format.html # dialogs.html.erb
        format.json { render json: @dialog_info }
        format.js
      end
    else 
      redirect_to "/403.html"
    end
  end
  
  def get_new_message
    if !session[:user].nil?
      @message = Message.find(
        :first,
        :select=>"*",
        :order => "created_at",
        :conditions => [
          "userto_id = (?) and readed = 0 and showed_popup = 0",
          session[:user].id
        ]
      )   
      if !@message.nil?
        render :partial =>"get_new_message"
        @message.update_attribute("showed_popup",true)
      else
        render :inline => "<div id =\"popup_message\"></div>" 
      end
    else 
      render :nothing => true
    end  
  end
  
  def get_new_dialog
    user_from = params[:user_from]
    if !session[:user].nil?
      @message = Message.find(
        :first,
        :select=>"*",
        :order => "created_at",
        :conditions => [
          "userfrom_id = (?) and userto_id = (?) and readed = 0 and showed_dialog = 0",
          user_from, 
          session[:user].id
        ]
      )   
      if !@message.nil? 
        render :partial =>"get_new_dialog"
        @message.update_attribute("showed_dialog",true)
      else 
        render :nothing => true
      end   
    else 
      render :nothing => true
    end
   
  end
 
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  def read
    @message = Message.find(params[:id])
    @message.update_attribute("readed", true)
    render :nothing => true
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @title = "Отправка сообщения"
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    params[:message][:userfrom_id]=session[:user].id
    @message = Message.new(params[:message])
    
    respond_to do |format|
      if @message.save
        format.html  
        format.json { render json: @message, status: :created, location: @message }
        format.js
      else
        format.html 
        format.json { render json: @message.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :ok }
    end
  end
  
  
end
