class UsersController < ApplicationController
  def new
    # p user_params
    @user = User.new
  end

  def create
    p user_params
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account Created. Please Login"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :personal_id, :name, :contact_no)
  end
end
