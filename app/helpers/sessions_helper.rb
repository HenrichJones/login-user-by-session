module SessionsHelper

  def sign_in
    session[:user_id] = @user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
