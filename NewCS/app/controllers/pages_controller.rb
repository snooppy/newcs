class PagesController < ApplicationController
  
  def prepod_home
    if !session[:user].nil?
      
    else
      redirect_to :action => "index"
    end
  end
  
  def forbiden
    "/pages/403.html.erb"
  end
  
end
