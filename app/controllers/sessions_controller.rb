class SessionsController < ApplicationController

  def create
    user = User.find_and_authenticate_user(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = "You are logged in."
      #redirect_to refers to a get command by default as it is
      #the only command to display. *_path is a combination of 
      #the RESTful actions
      redirect_to insurance_path(user.id)
    else
      flash[:danger] = "Credentials Invalid!!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "User logged out!!"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:password, :personal_id)
  end
end
