class EventsController < ApplicationController
  def scan
    # @events = params[:id]
    mess = Message.find_last_by_showed_popup_and_userto_id(false,session[:user].id)
    if ! mess.nil?  
      @events = "message;dialog"
      respond_to do |format|
        format.json { render json: @events }
      end
    else
      render :nothing=>true
    end
  end
end