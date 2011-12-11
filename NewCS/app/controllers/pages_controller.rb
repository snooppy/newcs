class PagesController < ApplicationController
  
  def index
      @title = "Home"
  end
  
  def forbiden
     "/pages/403.html.erb"
  end
  
end
