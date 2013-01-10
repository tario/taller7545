class PreRegistrationsController < ApplicationController
  def new
    @pre_registration = PreRegistration.new
  end

  def create
    @preregistration = PreRegistration.new(:email => params[:pre_registration][:email])
    @preregistration.save
  end
  
  def confirm
    pr = PreRegistration.find_by_confirm_token(params[:token])
    if pr
      @successful_confirmed = true
      pr.confirmed = true
      pr.save
    end
  end
end
