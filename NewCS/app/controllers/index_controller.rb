class IndexController < ApplicationController
  layout "index"
  def index
    @title = "Home"
    render :partial=> "layouts/index"
  end
  
end