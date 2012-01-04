# encoding: utf-8
class UsersController < ApplicationController
 
  require 'net/ldap'
  
  def sign_in
        
    ldap = Net::LDAP.new(
      host: LDAP_SERVER,
      :auth => {
        :method => :simple,
        :username => LDAP_ROOT,
        :password => LDAP_ROOT_PASSWORD
      }
    )        

    @user = User.find_all_by_login(params[:user][:login])[0]
    
    if ! @user.nil?   
      if (@user[:role] == ROLE_ADMIN ) 
        result = ldap.bind_as(:base => LDAP_ADMIN_BASE,
          :filter => "(cn="+params[:user][:login]+")",
          :password => params[:user][:password])
      elsif (@user[:role] == ROLE_MODERATOR )
        result = ldap.bind_as(:base => LDAP_MODERATOR_BASE,
          :filter => "(cn="+params[:user][:login]+")",
          :password => params[:user][:password])      
      elsif (@user[:role] == ROLE_PREPOD )
        result = ldap.bind_as(:base => LDAP_PREPOD_BASE,
          :filter => "(cn="+params[:user][:login]+")",
          :password => params[:user][:password])       
      elsif (@user[:role] == ROLE_STUDENT )
        result = ldap.bind_as(:base => LDAP_STUDENT_BASE,
          :filter => "(cn="+params[:user][:login]+")",
          :password => params[:user][:password])
      end           
    end    
    
    @user = User.find_by_login_and_password(params[:user][:login],params[:user][:password])
    result = true
    respond_to do |format|
      if result && ! @user.nil?
        session[:user] = @user           
        if !session[:user][:settings_id].nil?
          session[:user_options] = Setting.find( session[:user][:settings_id])
        else
          session[:user_options] = nil
        end
        format.js
        format.json { render json: @user, status: :created, location: @user }
      else
        format.js
        @errors="error"
        format.json { render json: @errors, status: ":unprocessable_entity" }        
      end
    end
  end
  
  def sign_out
    session[:user] = nil
    session[:user_options] = nil
    redirect_to_back
  end
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @title = "Пользователи"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    p session
    if session[:user].nil? 
      @user = User.new
    
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    else 
      respond_to do |format|
        format.html { redirect_to_back }
        format.json { head :ok }
      end
    end
    
    
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    # TODO process errors
    # TODO create folder
    # TODO create record in Folder
    if @user.save
      Dir.mkdir(Dir.pwd+"/app/assets/images/from_users/"+@user.id.to_s)
      render :partial => "/users/create"
    else
      render :partial => "/users/create"
    end
  
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  def add_user
    if ! session[:user].nil? && session[:user][:role] == ROLE_ADMIN
      @user = User.new

      respond_to do |format|
        format.html # add_user.html.erb
        format.json { render json: @user }
      end
    else 
      respond_to do |format|
        format.html { redirect_to_back }
        format.json { head :ok }
      end
    end
  end
  
  
  def add_user_to_ldap
    @user = User.new(params[:user])                
    
    if ! @user.nil?   
      if (@user[:role] == ROLE_ADMIN ) 
        dn = "cn="+@user[:login]+", " + LDAP_ADMIN_BASE
      elsif (@user[:role] == ROLE_MODERATOR )
        dn = "cn="+@user[:login]+", " + LDAP_MODERATOR_BASE
      elsif (@user[:role] == ROLE_PREPOD )
        dn = "cn="+@user[:login]+", " + LDAP_PREPOD_BASE
      elsif (@user[:role] == ROLE_STUDENT )
        dn = "cn="+@user[:login]+", " + LDAP_STUDENT_BASE
      end           
    
      attr = {
        :cn => @user[:login],
        :objectclass => ["organizationalperson", "inetorgperson"],
        :gn => @user[:first_name],
        :sn => @user[:second_name],
        :mail => @user[:email],
        :userpassword => @user[:password],
      }

      Net::LDAP.open(
        host: LDAP_SERVER,
        :auth => {
          :method => :simple,
          :username => LDAP_ROOT,
          :password => LDAP_ROOT_PASSWORD
        }) do |ldap|
        
        result = ldap.add(:dn => dn, :attributes => attr)  

        if result
          render :partial => "/users/add_user_to_ldap"
        else
          render :partial => "/users/add_user_to_ldap_fail"
        end
      end    
    end
  end
  
end
