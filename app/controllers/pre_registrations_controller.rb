class PreRegistrationsController < ApplicationController
  def new
    @pre_registration = PreRegistration.new
  end

  def create
    pr = PreRegistration.new(:email => params[:pre_registration][:email])
    pr.save
  end
end
