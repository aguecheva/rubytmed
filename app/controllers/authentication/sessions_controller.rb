

class Authentication::SessionsController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.find_by("email = :login OR username = :login", { login: params[:login]})

    if @user&.authentication(params[:password])
      redirect_to home_path, notice: t('Bienvenido')
    else
      redirect_to new_sessions_path, alert: t('Inicio de sesion fallido')
      # render :new, status: :unprocessable_entity

    end


    # @user = User.new(user_params)

      # if @user.save
      #     redirect_to root_path, notice: t('Usuario creado')
      # else
      #     render :new, status: :unprocessable_entity
      # end
  end

  private
  # def user_params
  #     params.require(:user).permit(:email, :username, :password)
  # end

end
