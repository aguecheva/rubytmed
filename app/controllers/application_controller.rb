class ApplicationController < ActionController::Base
    before_action :set_patients, if: :user_signed_in?
    before_action :configure_permitted_parameters, if: :devise_controller?

    def switch_locale(&action)
      I18n.with_locale(locale_from_header, &action)
    end

    private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def locale_from_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

    private

    def set_patients
      @patients = current_user.patients if user_signed_in?
    end


end
