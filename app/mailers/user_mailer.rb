class UserMailer < ActionMailer::Base
  default from: "no-reply@viajando7545.com"
  
  def prereg_mail(preregistration)
    @confirm_url = "http://taller7545.herokuapp.com/pre_registrations/confirm/#{preregistration.confirm_token}"
    mail(:to => preregistration.email, :subject => "Bienvenido a viajando.com")
  end  
end
