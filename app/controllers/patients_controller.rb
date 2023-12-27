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
      redirect_to @patient
    else
      render 'new'
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render 'edit'
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path
  end

   private
    def patient_params
        params.require(:patient).permit(:name, :lastname, :dni)
    end

end
