class UsersController < ApplicationController

  def new
    @user = User.new
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  def create
    @user = User.new(user_params)
    if @user.save

      flash[:success] = "Account Created. Please Login"
      redirect_to insurance_index_path

      # Tell the UserMailer to send a welcome email after save
      UserMailer.welcome_email(@user).deliver_now

      flash[:success] = "Account created & email sent. Please Login"
      redirect_to root_path

    else
      render :new
    end
  end

  # def destroy
  #   session[:user_id] = nil
  #   flash[:success] = "User logged out!!"
  #   redirect_to root_path
  # end

  private

  def user_params
    params.require(:user).permit(:email, :password, :personal_id, :name, :contact_no)
  end
end
