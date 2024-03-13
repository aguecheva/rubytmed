class PatientsController < ApplicationController


  def patients

    if params[:q]
      @patients = Patient.where("name LIKE ? OR lastname LIKE ? OR dni LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @patients = Patient.all
    end

    render template: 'patients/patients'

  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: t('.created')
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @consults = @patient.consults

  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Paciente actualizado correctamente!'
    else
      render 'edit', status: 422
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    ActiveRecord::Base.transaction do
      # Elimina registros relacionados (por ejemplo, consultas)
      @patient.consults.destroy_all
      # Luego elimina al paciente
      @patient.destroy
    end
    redirect_to patients_path, notice: 'Paciente eliminado correctamente.'
  rescue ActiveRecord::InvalidForeignKey
    redirect_to patients_path, alert: 'No se pudo eliminar el paciente debido a restricciones de clave externa.'
  end

  # def destroy
  #   @patient = Patient.find(params[:id])
  #   @patient.destroy
  #   redirect_to patients_path, notice: 'El paciente se ha eliminado correctamente.', status: :see_other
  # end

  private
    def patient_params
        params.require(:patient).permit(:name, :lastname, :dni, :birth_date, :consult_record, :photo)
    end

end
