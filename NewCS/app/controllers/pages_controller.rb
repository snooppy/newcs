class PagesController < ApplicationController
  
  def home
    if !session[:user].nil?
      if session[:user][:role] == '0'
        render :action => "admin_home"
      elsif session[:user][:role] == '1'
        render :action => "moderator_home"
      elsif session[:user][:role] == '2'
        render :action => "prepod_home"
      elsif session[:user][:role] == '3'        
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
  
end
