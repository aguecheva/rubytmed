class ApplicationController < ActionController::Base
    before_action :set_patients

    def index
    end

    private

    def set_patients
      @patients = current_user.patients if current_user
    end
end
