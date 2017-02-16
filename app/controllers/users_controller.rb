class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      # flash[:success] = 'Account Created. Please Login.'
      # redirect_to insurance_index_path

      flash[:success] = 'Account Created. Please Login.'
      redirect_to patient_admission_path(current_user.id)

      # Tell the UserMailer to send a welcome email after save
      UserMailer.welcome_email(@user).deliver_now

      flash[:success] = 'Account created & email sent. Please Login.'
      redirect_to login_path

    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # upload_file
    @user = User.find(params[:id])
    if @user.update!(user_params)
      # delete_old_file
      flash[:success] = 'User profile successfully updated.'
      UserMailer.update_profile(@user).deliver_now
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :personal_id, :name, :contact_no)
  end
end
