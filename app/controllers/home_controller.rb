class HomeController < ApplicationController



    def index
        if user_signed_in?
            @patients = current_user.patients
          else
            # Redirige al usuario a la página de inicio de sesión si no está autenticado
            redirect_to new_user_session_path, alert: "Debes iniciar sesión para ver esta página"
          end    end

    def show
    end
end
