class EventsController < ApplicationController
  def scan
    event = params[:events]
    if !session[:user].nil?
      @events = ""
      if event == "dialog"
        dialog = Message.find_last_by_showed_dialog_and_userto_id(false,session[:user].id)
        if !dialog.nil?
          @events="dialog;"
        end
      end
      mess = Message.find_last_by_showed_popup_and_userto_id(false,session[:user].id)
      if ! mess.nil?  
        @events += "message;"
        respond_to do |format|
          format.json { render json: @events }
        end
      else
        render :nothing=>true
      end
    else
      render :nothing => true
    end
  end
end