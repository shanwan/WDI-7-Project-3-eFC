class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
# before_action :is_authenticated

def is_authenticated
  unless current_user
    flash[:danger] = "Credentials Invalid!!"
    redirect_to login_path
  end
end

def current_user
  @current_user ||= User.find_by_id(user[:personal_id])
end

helper_method :current_user

end
