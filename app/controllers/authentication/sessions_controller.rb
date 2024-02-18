

class Authentication::SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to root_path, notice: t('Usuario creado')
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end

      # render :new, status: :unprocessable_entity




    # @user = User.new(user_params)

      # if @user.save
      #     redirect_to root_path, notice: t('Usuario creado')
      # else
      #     render :new, status: :unprocessable_entity
      # end


  # private
  # def user_params
  #     params.require(:user).permit(:email, :username, :password)
  # end
