class PagesController < ApplicationController
  
  def home
    if !session[:user].nil?
      if session[:user][:role] == ROLE_ADMIN
        render :action => "admin_home"
      elsif session[:user][:role] == ROLE_MODERATOR
        render :action => "moderator_home"
      elsif session[:user][:role] == ROLE_PREPOD
        render :action => "prepod_home"
      elsif session[:user][:role] == ROLE_STUDENT
        render :action => "student_home"    
      else
        redirect_to_back
      end
    else
      redirect_to_back
    end
  end
  
  
  def forbiden
    "/pages/403.html.erb"
  end
  
  def department_info
    render :action => "department_info"
  end
  
end
