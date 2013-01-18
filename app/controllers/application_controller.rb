class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/ or params[:mobile] == "1"
  end
  helper_method :mobile_device?  
end
