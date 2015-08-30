class RegistrationMailer < ApplicationMailer

  def email_token(user, url)
    @user        = user
    @verifyUrl   = url + '/users/verify/' +  user.id.to_s
    @activateUrl = url + '/users/activate/' + user.id.to_s + '/' + user.token
    mail(to: @user.email, subject: 'Conference Account Activation Token')
  end  
end