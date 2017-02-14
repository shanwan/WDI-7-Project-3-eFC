class UsersController < ApplicationController
  def new
    # p user_params
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.find_and_authenticate_user(user_params)

    if user
      session[:user_id] = user.id
      flash[:success] = "Account Created. Please Login"
      redirect_to root_path
      # redirect to the latest/ current admission page
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
    params.require(:user).permit(:email, :password, :personal_id, :name, :contact_no)
  end
end
