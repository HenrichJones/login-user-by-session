class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
    unless logged_in?
      redirect_to root_url
    end
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to users_path
    end
  end

end
