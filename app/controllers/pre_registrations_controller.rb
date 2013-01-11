class PreRegistrationsController < ApplicationController
  def new
    @pre_registration = PreRegistration.new
    render :layout => "pre_registrations"
  end

  def create
    @preregistration = PreRegistration.new(:email => params[:pre_registration][:email])
    @preregistration.save
    render :layout => "pre_registrations"
  end
  
  def confirm
    pr = PreRegistration.find_by_confirm_token(params[:token])
    if pr
      @successful_confirmed = true
      pr.confirmed = true
      pr.save
    end
    
    render :layout => "pre_registrations"
  end
end
