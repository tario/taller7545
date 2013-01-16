class SessionsController < ApplicationController
  def new
    render :layout => "sessions"
  end
  
  def create
    session[:current_user_id] = 1
    redirect_to '/'
  end
end
