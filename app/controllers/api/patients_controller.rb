class Api::PatientsController < Api::BaseController
  def index
    puts "PARAMS: #{params.inspect}"

    if params[:q]
      @patients = Patient.where(
        "name LIKE ? OR lastname LIKE ? OR dni LIKE ?",
        "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%"
      )
    else
      @patients = Patient.all
    end

    render status: 200, json: { data: @patients }
  end

  def show
    patient = Patient.find_by(id: params[:id])

    if patient.present?
      render status: 200, json: { data: patient }
    else
      head 404
    end
  end

  def create
    patient = Patient.new(patient_params)

    if patient.save
      render status: 200, json: { data: patient }
    else
      render status: 422, json: { errors: patient.errors.full_messages }
    end
  end

  private

  def patient_params
    params.permit(:name, :lastname, :dni, :birth_date)
  end
end
