class UserMailer < ApplicationMailer
  default from: 'efinancialcounselor@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://efinancialcounsellor.herokuapp.com/homepage'
    mail(to: @user.email, subject: 'Welcome to eFC!')
  end

  def update_profile(user)
    @user = user
    @url  = 'https://efinancialcounsellor.herokuapp.com/homepage'
    mail(to: @user.email, subject: 'User Profile Updated')
  end
end
