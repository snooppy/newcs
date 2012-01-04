# encoding: utf-8
class NotValidatedUsersController < ApplicationController
  
  def index
    if ! session[:user].nil? && session[:user][:role] == ROLE_ADMIN
      @not_validated_users = NotValidatedUser.all
      @title="Пользователи, подавшие заявку на регистрацию"
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @not_validated_users }
      end
    
    else 
      respond_to do |format|
        format.html { redirect_to_back }
        format.json { head :ok }
      end
    end
  end
  
  def new    
    if session[:user].nil?
      @not_validated_user = NotValidatedUser.new
      @title="Заполнение заявки на регистрацию"

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @not_validated_user }
      end
    else       
      redirect_to_back      
    end
  end

  def create
    @not_validated_user = NotValidatedUser.new(params[:not_validated_user])
    
    @user = User.find_all_by_login(@not_validated_user.login)[0]    
    
    if @user.nil?
      if @not_validated_user.save
        render :partial => "/not_validated_users/create"
      else
        render :partial => "/not_validated_users/create"
      end
    else
      render :partial => "/not_validated_users/create"
    end
  end

  def register_user    
    @valid_user = NotValidatedUser.find(params[:id])
    
    @user = User.new                
    @user[:email] = @valid_user[:email].force_encoding('ASCII-8BIT')
    @user.first_name = @valid_user.first_name.force_encoding('ASCII-8BIT')
    @user.second_name = @valid_user.second_name.force_encoding('ASCII-8BIT')
    @user.last_name = @valid_user.last_name.force_encoding('ASCII-8BIT')
    @user.login = @valid_user.login.force_encoding('ASCII-8BIT')
    @user.password = @valid_user.password.force_encoding('ASCII-8BIT')
    @user.sex = @valid_user.sex.force_encoding('ASCII-8BIT')
    @user.role = @valid_user.role.force_encoding('ASCII-8BIT')
     
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

      if ! result
        render :partial => "/users/add_user_to_ldap_fail"
      end
      
    end
    
    if ! @user.save
      render :partial => "/users/create"
    end
    
    @valid_user.destroy
    
    respond_to do |format|
      format.html { redirect_to not_validated_users_url }
      format.json { head :ok }
    end
    
  end
end
