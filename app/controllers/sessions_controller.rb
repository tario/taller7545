class SessionsController < ApplicationController
  def new
    render :layout => "sessions"
  end
  
  def create
    begin
      session[:current_user_id] = User.authorize(params[:email_username], params[:password]).id
      redirect_to '/'
    rescue SecurityError
      flash[:error] = "Username/password mismatch"
      redirect_to :action => :new
    end
  end
end
