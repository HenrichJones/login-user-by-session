class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to @user, notice: "Usuário criado com sucesso"
      sign_in @user
    else
      render action: :new
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:fullname,
              :cpf,
              :nickname,
              :active,
              :email,
              :password,
              :password_confirmation
            )
  end
end
