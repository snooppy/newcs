# encoding: utf-8
class IndexController < ApplicationController
  layout "index"
  def index
    @title = "Главная"
    render :partial=> "layouts/index"
  end
  
end