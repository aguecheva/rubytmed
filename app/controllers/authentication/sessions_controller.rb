class Authentication::SessionsController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.find_by(email: params[:login])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to home_show_path, notice: 'Has iniciado sesión correctamente'
      else
        @user = User.new(email: params[:email])
        flash.now[:alert] = 'Email o contraseña incorrecta'
        render :new
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Has cerrado sesión correctamente'
    end
end










# class Authentication::SessionsController < ApplicationController
#     def new
#         @user = User.new
#     end

#     def create
#         @user = User.new(user_params)

#         if @user.save
#             redirect_to root_path, notice: t('Usuario creado')
#         else
#             render :new, status: :unprocessable_entity
#         end
#     end

#     private
#     def user_params
#         params.require(:user).permit(:email, :username, :password, :password_confirmation)
#     end
# end

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
