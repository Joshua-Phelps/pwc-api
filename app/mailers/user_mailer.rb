class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3001/login'
    mail(to: @user.email, subject: 'Welcome to Paws with Cause')
  end
  
  def forgot_password(user)
    @user = user
    @url = 'http://localhost:3001/password-reset/' + @user.password_reset_token
    mail to: @user.email, :subject => 'Reset password instructions'
  end

end