class Api::PatientsController < Api::BaseController
  before_action :authenticate_user! 

  def index
    render status: 200,
           json: { ok: true, data: Patient.all }
  end

  def show
    patient = Patient.find_by(id: params[:id])

    if patient
      render status: 200,
             json: { ok: true, data: patient }
    else
      render status: 404, json: { ok: false, error: 'Patient not found' }
    end
  end

  def create
    patient = Patient.new(patient_params)

    if patient.save
      render status: 200, json: { ok: true, data: patient }
    else
      render status: 422, json: { ok: false, errors: patient.errors.full_messages }
    end
  end

  private

  def patient_params
    params.permit(:name, :lastname, :dni, :birth_date)
  end
end
