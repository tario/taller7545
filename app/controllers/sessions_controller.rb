class SessionsController < ApplicationController
  def new
    render :layout => "sessions"
  end
  
  def create
    session[:current_user_id] = User.authorize(params[:email_username], params[:password]).id
    redirect_to '/'
  end
end
