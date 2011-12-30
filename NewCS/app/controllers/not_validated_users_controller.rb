class NotValidatedUsersController < ApplicationController
  
  def index
    if ! session[:user].nil? && session[:user][:role] == '0'
      @not_validated_users = NotValidatedUser.all

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
    @not_validated_user = NotValidatedUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @not_validated_user }
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
    @user[:email] = @valid_user[:email]
    @user.first_name = @valid_user.first_name
    @user.second_name = @valid_user.second_name
    @user.last_name = @valid_user.last_name
    @user.login = @valid_user.login
    @user.password = @valid_user.password
    @user.sex = @valid_user.sex
    @user.role = @valid_user.role
     
    if (@user[:role] == "0") 
      dn = "cn="+@user[:login]+", ou=admins, o=newcs, dc=ua"
    elsif (@user[:role] == "1" )
      dn = "cn="+@user[:login]+", ou=moderators, o=newcs, dc=ua"
    elsif (@user[:role] == "2" )
      dn = "cn="+@user[:login]+", ou=prepods, o=newcs, dc=ua"
    elsif (@user[:role] == "3" )
      dn = "cn="+@user[:login]+", ou=users, o=newcs, dc=ua"
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
      host: '192.168.56.101',
      :auth => {
        :method => :simple,
        :username => "cn=root, o=newcs, dc=ua",
        :password => "qwerty"
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
