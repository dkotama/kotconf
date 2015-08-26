class RegistrationMailer < ApplicationMailer
  def email_token(user)
    @user = user 
    mail(to: @user.email, subject: 'Conference Account Activation Token')
  end  
end