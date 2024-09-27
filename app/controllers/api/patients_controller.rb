class Api::PatientsController < Api::BaseController
  before_action :authenticate_user!
  def index
    render status: 200,
    ok: true,
    json: {
        data: Patient.all
      }
  end

  def show
    patient = Patient.find_by(id: params[:id])

    if patient.present?
      render status: 200,
        ok: true,
        json: {
        data: patient
        }
    else
      head({  :status => 404,
              :ok => false
      })
    end
  end

  def create
    patient = Patient.new(patient_params)

    if patient.save()
      render status: 200,
      ok: true,
      json: {
        data: patient
      }
    else
      render status: 422,
      ok: false,
      json: {
        errors: patient.errors.full_messages
      }
    end
  end
  def patient_params
    params.permit(:name, :lastname, :dni, :birth_date)
  end
end
