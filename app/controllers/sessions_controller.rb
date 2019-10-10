class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && user.authenticate(email: params[:session][:email])
      sign_in @user 
      redirect_to @user
    else
      render :new
    end
  end

end
