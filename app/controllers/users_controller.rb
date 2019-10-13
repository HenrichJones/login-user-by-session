class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :update, :destroy]

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
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = @user = User.find(params[:id])
    return redirect_to users_path if @user.update_attributes(user_params)
    render action: :edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    sign_out
    redirect_to root_path
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
