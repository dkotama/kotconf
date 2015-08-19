class RegistrationMailer < ApplicationMailer 
  default from: 'from@example.com'

  def registration_email(user)
    @user = user 
    mail(to: @user.email, subject: 'Conference Account Activation Token')
  end  
end