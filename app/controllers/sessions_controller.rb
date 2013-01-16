class SessionsController < ApplicationController
  def new
    render :layout => "pre_registrations"
  end
  
  def create
    session[:current_user_id] = 1
    redirect_to '/'
  end
end
