class Users::RegistrationsController < Devise::RegistrationsController
  # Sobrescribe las acciones que necesites aquí
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
