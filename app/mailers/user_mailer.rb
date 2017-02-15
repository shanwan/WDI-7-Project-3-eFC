class UserMailer < ApplicationMailer
  default from: 'stephanietanlf@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://efc.herokuapp.com/homepage'
    mail(to: @user.email, subject: 'Welcome to eFC!')
  end
end
