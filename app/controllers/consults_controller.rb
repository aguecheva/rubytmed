class ConsultsController < ApplicationController

    def index
        @patient = Patient.find(params[:patient_id])
        @consults = @patient.consults
    end
      

    def create
        @patient = Patient.find(params[:patient_id])
        @consult = @patient.consults.create(consult_params)
        redirect_to patient_path(@patient)
    end
      
      private
        def consult_params
          params.require(:consult).permit(:description)
        end
      
end
