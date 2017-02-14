class SessionsController < ApplicationController

  def create
    user = User.find_and_authenticate_user(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = "You are logged in."
      redirect_to patient_admission_path(user.id)
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
